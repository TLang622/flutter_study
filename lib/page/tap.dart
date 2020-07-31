import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';

class Tap extends StatefulWidget {
  Tap({Key key}) : super(key: key);

  @override
  _TapState createState() {
    return _TapState();
  }
}

class _TapState extends State<Tap> {
  int _currentIndex=0;
  List _pages = [Page1(), Page2()];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: this._pages[this._currentIndex],
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




