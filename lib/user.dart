import 'package:flutter/material.dart';
import 'admin.dart';
import 'map.dart';

class UserPage extends StatefulWidget {
  static String tag= 'user-page';
  @override
  _UserPageState createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage>{
  @override
  Widget build(BuildContext context) {

    Widget userpage = new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new ButtonBar(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.home), onPressed:(){} ,iconSize: 34, color: Colors.black),
                      new Container(
                        child: new Text('Home', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                      )
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.map), onPressed:(){} ,iconSize: 34, color: Colors.black),
                      new Container(
                        child: new Text('Map', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                      )
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.insert_drive_file), onPressed:(){} ,iconSize: 34, color: Colors.black),
                      new Container(
                        child: new Text('Requests', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                      )
                    ],
                  )
                ],
                alignment: MainAxisAlignment.spaceEvenly,
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