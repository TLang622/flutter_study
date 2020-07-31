import 'package:flutter/material.dart';

class Page1 extends StatefulWidget {
  Page1({Key key}) : super(key: key);

  @override
  _Page1State createState() {
    return _Page1State();
  }
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('page4'),
          onPressed: (){
            Navigator.pushNamed(context, '/page4', arguments: {
              "id": 123
            });
          },
        ),
        RaisedButton(
          child: Text('tabBar'),
          onPressed: (){
            Navigator.pushNamed(context, '/tabBar');
          },
        ),
        RaisedButton(
          child: Text('page5'),
          onPressed: (){
            Navigator.pushNamed(context, '/page5');
          },
        ),
        RaisedButton(
          child: Text('page6'),
          onPressed: (){
            Navigator.pushNamed(context, '/page6');
          },
        ),
        RaisedButton(
          child: Text('page7'),
          onPressed: (){
            Navigator.pushNamed(context, '/page7');
          },
        ),
        RaisedButton(
          child: Text('page8'),
          onPressed: (){
            Navigator.pushNamed(context, '/page8');
          },
        ),
        RaisedButton(
          child: Text('page9'),
          onPressed: (){
            Navigator.pushNamed(context, '/page9');
          },
        ),
        RaisedButton(
          child: Text('page10'),
          onPressed: (){
            Navigator.pushNamed(context, '/page10');
          },
        ),
        RaisedButton(
          child: Text('page11'),
          onPressed: (){
            Navigator.pushNamed(context, '/page11');
          },
        ),
        RaisedButton(
          child: Text('page12'),
          onPressed: (){
            Navigator.pushNamed(context, '/page12');
          },
        )
      ],
    );
  }
}




