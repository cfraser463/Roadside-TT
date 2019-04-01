import 'package:flutter/material.dart';
import 'user.dart';
import 'admin.dart';
import 'map.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new LoginPageState();
}
enum FormType {
  login,
  register
}

class LoginPageState extends State<LoginPage> {

  final TextEditingController emailFilter = new TextEditingController();
  final TextEditingController passwordFilter = new TextEditingController();
  String email = "";
  String password = "";
  FormType form = FormType.login;

  LoginPageState() {
    emailFilter.addListener(emailListen);
    passwordFilter.addListener(passwordListen);
  }

  void emailListen() {
    if (emailFilter.text.isEmpty) {
      email = "";
    } else {
      email = emailFilter.text;
    }
  }

  void passwordListen() {
    if (passwordFilter.text.isEmpty) {
      password = "";
    } else {
      password = passwordFilter.text;
    }
  }

  // Swap in between our two forms, registering and logging in
  void formChange () async {
    setState(() {
      if (form == FormType.register) {
        form = FormType.login;
      } else {
        form = FormType.register;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: buildBar(context),
      body: buildPage(),
    );
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(
      title: new Text("Roadside TT"),
      centerTitle: true,
    );
  }
  Widget buildPage(){
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
                image: AssetImage('assets/img/roadsideMobile.jpg'),
            fit: BoxFit.cover)
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Container(
                child: new Expanded(
                    child: new SingleChildScrollView(
                        child: new Card(
                          elevation: 5.0,
                          margin: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 0),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)
                          ),
                          child: new Wrap(
                            children: <Widget>[
                              Center(
                                  child: new Container(
                                    padding: const EdgeInsets.only(top: 25.0,bottom: 10.0),
                                    child: new Text('Login', style: TextStyle(
                                      fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )
                              ),
                              new ListTile(
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
                                leading: const Icon(Icons.person),
                                title: new TextFormField(
                                  controller: emailFilter,
                                  decoration: new InputDecoration(
                                    fillColor: Colors.black,
                                    hintText: 'Please enter email',
                                    labelText: 'Enter Your Email address',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                              new ListTile(
                                contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 35.0),
                                leading: const Icon(Icons.lock),
                                title: new TextFormField(
                                  controller: passwordFilter,
                                  decoration: new InputDecoration(
                                    hintText: 'Please enter password',
                                    labelText: 'Enter Your Password',
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  obscureText: true,
                                ),
                              ),
                              Center(
                                child: Container(
                                  child: new Stack(
                                    children: <Widget>[
                                      buildButtons()
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                    ),
                ),
              )
            ],
          ),
        )
      ],
    );
}

   Widget buildButtons() {
    if (form == FormType.login) {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Login', style: TextStyle(color: Colors.amberAccent, fontSize: 20),),
              onPressed: loginPressed,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0)
              ),
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
            ),
            new FlatButton(
              padding: EdgeInsets.only(top: 25.0,bottom: 10.0),
              child: new Text('Dont have an account? Tap here to register.'),
              onPressed: formChange,
              splashColor: Colors.white10,
            ),
            new FlatButton(
              child: new Text('Forgot Password?'),
              onPressed: passwordReset,
            ),
            new Container(
              padding: const EdgeInsets.only(bottom: 30.0),
            )
          ],
        ),
      );
    } else {
      return new Container(
        child: new Column(
          children: <Widget>[
            new RaisedButton(
              child: new Text('Create an Account', style: TextStyle(fontSize: 18, color: Colors.amberAccent),),
              onPressed: createAccountPressed,
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)
              ),
              color: Colors.black,
              padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            ),
            new FlatButton(
              padding: EdgeInsets.only(top: 20.0,bottom: 20.0),
              child: new Text('Have an account? Click here to login.'),
              onPressed: formChange,
            ),
            new Container(
              padding: const EdgeInsets.only(bottom: 30.0),
            ),
          ],
        ),
      );
    }
  }

  void loginPressed () {
    print('The user wants to login with $email and $password');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MapPage()),
      );
  }

  void createAccountPressed () {
    print('The user wants to create an accoutn with $email and $password');

  }

  void passwordReset () {
    print("The user wants a password reset request sent to $email");
  }


}