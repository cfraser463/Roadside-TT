import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geolocator/geolocator.dart';


class ViewMapPage extends StatefulWidget {
  static String tag= 'view-map-page';
  @override
  _ViewMapPageState createState() => new _ViewMapPageState();
}

class _ViewMapPageState extends State<ViewMapPage>{

  GoogleMapController mycontroller;

  @override
  Widget build(BuildContext context) {

    Widget mappage = new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(10.6409,61.4003), zoom: 21),
              onMapCreated: (controller){
                setState(() {
                  mycontroller= controller;
                });
              },
              mapType: MapType.normal,
            ),
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
          ),
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