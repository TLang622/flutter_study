import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class Page8 extends StatefulWidget {
  Page8({Key key}) : super(key: key);

  @override
  _Page8State createState() {
    return _Page8State();
  }
}

class _Page8State extends State<Page8> {
  @override
  void initState() {
    super.initState();
    blueScan();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void blueScan() {
    FlutterBlue flutterBlue = FlutterBlue.instance;
    flutterBlue.startScan(timeout: Duration(seconds: 5));

    flutterBlue.scanResults.listen((results) {
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.rssi}');
      }
    });

    flutterBlue.stopScan();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('1111');
  }
}