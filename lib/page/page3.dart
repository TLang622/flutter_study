import 'package:flutter/material.dart';

class Page3 extends StatefulWidget {
  Page3({Key key}) : super(key: key);

  @override
  _Page3State createState() {
    return _Page3State();
  }
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: Text('333'),
    );
  }
}