import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'user.dart';
import 'admin.dart';

class MapPage extends StatefulWidget {
  static String tag= 'user-page';
  @override
  _MapPageState createState() => new _MapPageState();
}

class _MapPageState extends State<MapPage>{

  GoogleMapController mycontroller;

  @override
  Widget build(BuildContext context) {

    Widget mappage = new Stack(
      fit: StackFit.expand,
        children: <Widget>[
         new Container(
           margin: EdgeInsets.only(bottom: 75.0),
           child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(61.4003, 10.6409), zoom: 19.124332),
             onMapCreated: (controller){
              setState(() {
                mycontroller= controller;
              });
             },
           ),
         ),
          new Column(
            children: <Widget>[
              new ButtonBar(
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.home), onPressed:(){} ,iconSize: 30, color: Colors.black),
                      new Container(
                        child: new Text('Home', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                      )
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.map), onPressed:(){} ,iconSize: 30, color: Colors.black),
                      new Container(
                        child: new Text('Map', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                      )
                    ],
                  ),
                  new Column(
                    children: <Widget>[
                      new IconButton(icon: Icon(Icons.insert_drive_file), onPressed:(){} ,iconSize: 30, color: Colors.black),
                      new Container(
                        child: new Text('Requests', style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                      )
                    ],
                  )
                ],
                alignment: MainAxisAlignment.spaceAround,
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