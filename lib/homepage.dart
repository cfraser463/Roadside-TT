import 'package:flutter/material.dart';
import 'login.dart';
import 'viewmap.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    Widget homepage = new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/img/roadsideMobile.jpg'),
                  fit: BoxFit.cover),
            ),
            child: new Container(
              padding: EdgeInsets.only(bottom: 10.0),
              child: new Column(
                children: <Widget>[
                  new Image.asset('assets/icons/logo_transparent.png',
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ViewMapPage()),
                      );
                    },
                    child: const Text('View Map',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent),),
                    color: Colors.black,
                    splashColor: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(80.0, 20.0, 80.0, 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                  ),
                  new Container(
                    padding: const EdgeInsets.only(top: 15.0),
                  ),
                  new RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text('Login',
                      style: TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.amberAccent),),
                    color: Colors.black,
                    splashColor: Colors.grey,
                    padding: const EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0)
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ) ,
            )
        ),
      ],
    );

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: homepage
    );
  }
}