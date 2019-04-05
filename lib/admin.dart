import 'package:flutter/material.dart';
import 'user.dart';
import 'map.dart';

class AdminPage extends StatefulWidget {
  static String tag= 'admin-page';
  @override
  _AdminPageState createState() => new _AdminPageState();
}

class _AdminPageState extends State<AdminPage>{
  @override
  Widget build(BuildContext context) {

    Widget adminpage = new Stack(
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
        body: adminpage
    );
  }
}