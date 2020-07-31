import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'dart:async';

class Page9 extends StatefulWidget {
  Page9({Key key}) : super(key: key);

  @override
  _Page9State createState() {
    return _Page9State();
  }
}

class _Page9State extends State<Page9> {
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;
  List<StreamSubscription<dynamic>> _streamSubscriptions = <StreamSubscription<dynamic>>[];
  

  @override
  void initState() {
    super.initState();

    _streamSubscriptions.add(accelerometerEvents.listen((AccelerometerEvent event) {
      print('11111111111$event');
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(gyroscopeEvents.listen((GyroscopeEvent event) {
      print('22222222222$event');
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    }));
    _streamSubscriptions.add(userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      print('33333333333$event');
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    }));
  }

  @override
  void dispose() {
    super.dispose();

    for (StreamSubscription<dynamic> subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Text('222');
  }
}