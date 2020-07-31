import 'package:flutter/material.dart';

class Page5 extends StatefulWidget {
  Page5({Key key}) : super(key: key);

  @override
  _Page5State createState() {
    return _Page5State();
  }
}

class _Page5State extends State<Page5> {
  var _userName=new TextEditingController();//初始化赋值
  var _password;
  var _flag=true;
  var _sex;
  var _tag=true;
  List _list=[
    {
      "checked":true,
      "title":"吃饭"
    },
    {
      "checked":false,
      "title":"睡觉"
    },
    {
      "checked":true,
      "title":"洗澡"
    }
  ];

  List<Widget> _getList() {
    List<Widget> temList=[];
    for(var i=0; i<_list.length; i++){
      temList.add(
        Row(
          children: <Widget>[
            Checkbox(
              value: _list[i]["checked"],
              onChanged: (value){
                setState(() {
                  _list[i]["checked"]=value;
                });
              },
            ),
            Text(_list[i]["title"]),
          ],
        )
      );
    }
    return temList;
  }

  @override
  void initState() {
    super.initState();
    _userName.text='张三';
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(icon: Icon(Icons.people)),
              controller: _userName,
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              child: TextField(
                decoration: InputDecoration(hintText: '文本框', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              maxLines: 4,
              maxLength: 20,
              decoration: InputDecoration(hintText: '多行文本框', border: OutlineInputBorder()),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(hintText: '密码框', border: OutlineInputBorder(), labelText: '密码'),
              style: TextStyle(
                height: 2.0
              ),
              onChanged: (value){
                setState(() {
                  _password=value;
                });
              },
            ),
            SizedBox(height: 20),
            Container(
              child: RaisedButton(
                child: Text('登录'),
                onPressed: (){
                  print(_userName.text);
                  print(_password);
                  print(_list);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Checkbox(
                  value: _flag,
                  onChanged: (value){
                    setState(() {
                      print(value);
                      _flag=value;
                    });
                  },
                ),
                Text('你好'),
              ],
            ),
            CheckboxListTile(
              value: _flag,
              title: Text('标题'),
              subtitle: Text('副标题'),
              secondary: Icon(Icons.help),
              selected: _flag,
              onChanged: (value){
                setState(() {
                  print(value);
                  _flag=value;
                });
              },
            ),
            Row(
              children: <Widget>[
                Radio(
                  value: 1,
                  groupValue: _sex,
                  onChanged: (value){
                    setState(() {
                      _sex=value;
                    });
                  },
                ),
                Text('你好'),
              ],
            ),
            RadioListTile(
              title: Text('男'),
              value: 1,
              groupValue: _sex,
              onChanged: (value){
                setState(() {
                  _sex=value;
                });
              },
            ),
            RadioListTile(
              title: Text('女'),
              subtitle: Text('副标题'),
              secondary: Image.network('https://wondfo-ai-testing-web.oss-cn-shenzhen.aliyuncs.com/devices/%E6%99%BA%E8%83%BD%E5%88%86%E6%9E%90%E4%BB%AA%20.png'),
              selected: _sex==2,
              value: 2,
              groupValue: _sex,
              onChanged: (value){
                setState(() {
                  _sex=value;
                });
              },
            ),
            SizedBox(height: 20,),
            Switch(
              value: _tag,
              onChanged: (value){
                setState(() {
                  _tag=value;
                });
              },
            ),
            SizedBox(height: 20,),
            Column(
              children: _getList(),
            )
          ],
        ),
      )
    );
  }
}