import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  static String tag= 'user-page';
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage>{
  @override
  Widget build(BuildContext context) {

    Widget buildButton(IconData icon, String title){
      final Color bcol= Colors.black;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: bcol,size: 30),
          new Container(
            child: new Text(title, style: new TextStyle(fontSize: 16, color: bcol)),
          )
        ],
      );
    }
    Widget userpage = new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new ButtonBar(
                children: <Widget>[
                  buildButton(Icons.home, "Home"),
                  buildButton(Icons.map, "Map"),
                  buildButton(Icons.list, "Requests"),
                ],
                alignment: MainAxisAlignment.spaceBetween,
              )
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          )
        ]
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          centerTitle: true,
        ),
        body: userpage
    );
  }
}