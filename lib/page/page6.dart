import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Page6 extends StatefulWidget {
  Page6({Key key}) : super(key: key);

  @override
  _Page6State createState() {
    return _Page6State();
  }
}

class _Page6State extends State<Page6> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List _list=[];
  _getData() async{
    // 模拟器或者手机访问不到本地dns，所以无法访问yapi
    Response response=await Dio().get('http://www.phonegap100.com/appapi.php?a=getPortalList&catid=1&page=1');
    print(response.data is String);
    print(json.decode(response.data));
    setState(() {
      _list=json.decode(response.data)['result'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("ajax"),
      ),
      body: _list.length>0?ListView(
        children: _list.map((value){
          return ListTile(
            title: Text(value['title']),
          );
        }).toList()
      ):Text('加载中'),
    );
  }
}