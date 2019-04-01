import 'package:flutter/material.dart';

class RequestPage extends StatefulWidget {
  static String tag= 'request-page';
  @override
  _RequestPageState createState() => new _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {
  List<String> services= ['Accident', 'Car not starting', 'Dead Battery', 'Flat Tyre', 'No gas'];
  String dropdown;

  @override
  Widget build(BuildContext context) {

      Widget requestpage = new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              new ListTile(
                leading: const Icon(Icons.person,color: Colors.lightBlueAccent),
                title: new TextField(
                  scrollPadding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                  decoration: new InputDecoration(
                    hintText: "Name",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.phone,color: Colors.lightBlueAccent),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "Phone No.",
                  ),
                ),
              ),
              new ListTile(
                leading: const Icon(Icons.directions_car,color: Colors.lightBlueAccent),
                title: new TextField(
                  decoration: new InputDecoration(
                    hintText: "License Plate No.",
                  ),
                ),
              ),
              new Container(
                padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                child: new DropdownButton<String>(
                  hint: Text('Service Type',style: TextStyle(fontSize: 16),),
                  value: dropdown,
                  items: services.map((String item) => new DropdownMenuItem<String>(
                    value: item,
                    child: new SizedBox(width: 300.0, height: 100.0, child: new Text(item, textAlign: TextAlign.center,)),
                  ))
                  .toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdown = newValue;
                    });
                  },
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.start,
          )
        ]
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('Request Assistance'),
          centerTitle: true,
        ),
        body: requestpage
    );
  }
}