import 'package:flutter/material.dart';

class Page4 extends StatefulWidget {
  final arguments;
  Page4({this.arguments});

  @override
  _Page4State createState() {
    return _Page4State(arguments: arguments);
  }
}

class _Page4State extends State<Page4> {
  final arguments;
  _Page4State({this.arguments});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: Text('${this.arguments}'),
    );
  }
}




