import 'package:flutter/material.dart';
import 'page3.dart';
import 'page4.dart';
import 'page5.dart';
import 'page6.dart';
import 'page7.dart';
import 'page8.dart';
import 'page9.dart';
import 'page10.dart';
import 'page11.dart';
import 'page12.dart';
import 'tap.dart';
import 'toptap.dart';

final routes={
  '/':(context)=>Tap(),
  '/page3':(context)=>Page3(),
  '/page4':(context, {arguments})=>Page4(arguments:arguments),
  '/tabBar':(context)=>TabBarControllerPage(),
  '/page5':(context)=>Page5(),
  '/page6':(context)=>Page6(),
  '/page7':(context)=>Page7(),
  '/page8':(context)=>Page8(),
  '/page9':(context)=>Page9(),
  '/page10':(context)=>Page10(),
  '/page11':(context)=>Page11(),
  '/page12':(context)=>Page12(),
};

var onGenerateRoute=(RouteSettings settings){
  print('router');
  final String name = settings.name;
  final Function pageCotentBuilder = routes[name];
  if(pageCotentBuilder != null){
    if(settings.arguments != null){
      final Route route = MaterialPageRoute(
        builder: (context) => pageCotentBuilder(context, arguments: settings.arguments)
      );
      print('router arguments');
      return route;
  }else{
    final Route route=MaterialPageRoute(
      builder: (context)=>pageCotentBuilder(context)
    );
    print('router no arguments');
    return route;
    }
  }
};