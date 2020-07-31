import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Tap()
    );
  }
}

class Tap extends StatefulWidget {
  Tap({Key key}) : super(key: key);

  @override
  _TapState createState() {
    return _TapState();
  }
}

class _TapState extends State<Tap> {
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: MyHomePage(),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: this._currentIndex,
          onTap: (int index){
            print(index);
            setState(() {
              this._currentIndex=index;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('首页')
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('设置')
            )
          ]
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int num = 0;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Text('${this.num}'),
        RaisedButton(
          child: Text('click'),
          onPressed: (){
            setState(() {
              this.num++;
            });
          },
        )
      ],
    );
  }
}




