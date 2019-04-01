import 'package:flutter/material.dart';

class MapPage extends StatefulWidget {
  static String tag= 'user-page';
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage>{
  @override
  Widget build(BuildContext context) {

    Widget mappage = new Stack(
        fit: StackFit.expand,
        children: <Widget>[
         new Container(
          decoration: new BoxDecoration(
          image: new DecorationImage(
          image: AssetImage('assets/img/roadsideMobile.jpg'),
          fit: BoxFit.cover),
          ),
         ),
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
          title: Text('Roadside Map'),
          centerTitle: true,
        ),
        body: mappage
    );
  }
}