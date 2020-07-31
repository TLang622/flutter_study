import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("标题"),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          color: Color.fromRGBO(100, 100, 100, 0.5)
        ),
        child: Text(
          'hello',
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontSize: 40.0,
              color: Color.fromRGBO(244, 233, 121, 0.5),
              decoration: TextDecoration.none
          ),
        ),
      )
    );
  }
}
