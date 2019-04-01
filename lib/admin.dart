import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  static String tag= 'user-page';
  @override
  _AdminPageState createState() => new _AdminPageState();
}

class _AdminPageState extends State<AdminPage>{
  @override
  Widget build(BuildContext context) {

    Widget buildButton(IconData icon, String title){
      final Color bcol= Colors.black;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: bcol,size: 30),
          new Container(
            child: new Text(title, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: bcol)),
          )
        ],
      );
    }
    Widget adminpage = new Stack(
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
        body: adminpage
    );
  }
}