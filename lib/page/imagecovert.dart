import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:ffi/ffi.dart';
import 'package:camera/camera.dart';
import 'package:image/image.dart' as imglib;

typedef convert_func = Pointer<Uint32> Function(Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, Int32, Int32, Int32, Int32);
typedef Convert = Pointer<Uint32> Function(Pointer<Uint8>, Pointer<Uint8>, Pointer<Uint8>, int, int, int, int);

final DynamicLibrary convertImageLib = Platform.isAndroid ? DynamicLibrary.open("libconvertImage.so") : DynamicLibrary.process();
Convert conv = convertImageLib.lookup<NativeFunction<convert_func>>('convertImage').asFunction<Convert>();

getImage(CameraImage _savedImage) {
  print(222222222222);
  print(_savedImage);
  if(_savedImage == null) {
    return null;
  }
  Stopwatch stopwatch = new Stopwatch()..start();
  // Allocate memory for the 3 planes of the image
  Pointer<Uint8> p = allocate(count: _savedImage.planes[0].bytes.length);
  Pointer<Uint8> p1 = allocate(count: _savedImage.planes[1].bytes.length);
  Pointer<Uint8> p2 = allocate(count: _savedImage.planes[2].bytes.length);

  // Assign the planes data to the pointers of the image
  Uint8List pointerList = p.asTypedList(_savedImage.planes[0].bytes.length);
  Uint8List pointerList1 = p1.asTypedList(_savedImage.planes[1].bytes.length);
  Uint8List pointerList2 = p2.asTypedList(_savedImage.planes[2].bytes.length);
  pointerList.setRange(0, _savedImage.planes[0].bytes.length, _savedImage.planes[0].bytes);
  pointerList1.setRange(0, _savedImage.planes[1].bytes.length, _savedImage.planes[1].bytes);
  pointerList2.setRange(0, _savedImage.planes[2].bytes.length, _savedImage.planes[2].bytes);

  // Call the convertImage function and convert the YUV to RGB
  Pointer<Uint32> imgP = conv(p, p1, p2, _savedImage.planes[1].bytesPerRow,
      _savedImage.planes[1].bytesPerPixel, _savedImage.width, _savedImage.height);
  // Get the pointer of the data returned from the function to a List
  List imgData = imgP.asTypedList((_savedImage.width * _savedImage.height));

  // Generate image from the converted data
  imglib.Image img = imglib.Image.fromBytes(_savedImage.height, _savedImage.width, imgData);

  print("4 =====> ${stopwatch.elapsedMilliseconds}");

  // Free the memory space allocated
  // from the planes and the converted data
  free(p);
  free(p1);
  free(p2);
  free(imgP);
  return imgData;
}