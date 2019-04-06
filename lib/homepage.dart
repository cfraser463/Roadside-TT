import 'package:flutter/material.dart';
import 'login.dart';
import 'request.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

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
                      MaterialPageRoute(builder: (context) => RequestPage()),
                    );
                  },
                  child: const Text('Request Assistance',
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
//                new Container(
//                  padding: const EdgeInsets.only(top: 30.0),
//                ),
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
                  padding: const EdgeInsets.fromLTRB(140.0, 20.0, 140.0, 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0)
                  ),
                ),
                new Container(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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