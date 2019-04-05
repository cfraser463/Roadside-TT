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
  final TextEditingController nameFilter = new TextEditingController();
  final TextEditingController plateFilter =  new TextEditingController();
  final TextEditingController confirmFilter = new TextEditingController();

  String name= "";
  String cpass= "";
  String plate= "";
  String email = "";
  String password = "";
  FormType form = FormType.login;

  LoginPageState() {
    nameFilter.addListener(nameListen);
    emailFilter.addListener(emailListen);
    plateFilter.addListener(plateListen);
    passwordFilter.addListener(passwordListen);
    confirmFilter.addListener(confirmListen);
  }

  void nameListen() {
    if (nameFilter.text.isEmpty) {
      name = "";
    } else {
      name = nameFilter.text;
    }
  }

  void plateListen() {
    if (plateFilter.text.isEmpty) {
      plate = "";
    } else {
      plate = plateFilter.text;
    }
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

  void confirmListen() {
    if (confirmFilter.text.isEmpty) {
      cpass = "";
    } else {
      cpass = confirmFilter.text;
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
    if (form == FormType.login) {
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
                                  padding: const EdgeInsets.only(
                                      top: 25.0, bottom: 10.0),
                                  child: new Text('Login', style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,),
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                            ),
                            new ListTile(
                              contentPadding: EdgeInsets.fromLTRB(
                                  10.0, 0, 10.0, 15.0),
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
                              contentPadding: EdgeInsets.fromLTRB(
                                  10.0, 0, 10.0, 35.0),
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
                            new Container(
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
                            ),
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
    } else {
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
                    margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 10.0),
                    shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)
                    ),
                    child: new Wrap(
                      children: <Widget>[
                        Center(
                          child: new Container(
                          padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
                            child: new Text('Register', style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,),
                              textAlign: TextAlign.justify,
                            ),
                         )
                        ),
                        new ListTile(
                          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          leading: const Icon(Icons.person),
                          title: new TextFormField(
                            controller: nameFilter,
                            decoration: new InputDecoration(
                              fillColor: Colors.black,
                              hintText: 'Please enter your name',
                              labelText: 'Enter Your Name',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        new ListTile(
                          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                          leading: const Icon(Icons.email),
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
                          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
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
                        new ListTile(
                          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                          leading: const Icon(Icons.lock),
                          title: new TextFormField(
                            controller: confirmFilter,
                            decoration: new InputDecoration(
                              hintText: 'Please confirm your password',
                              labelText: 'Confirm Your Password',
                            ),
                            keyboardType: TextInputType.emailAddress,
                            obscureText: true,
                          ),
                        ),
                        new ListTile(
                          contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 15.0),
                          leading: const Icon(Icons.directions_car),
                          title: new TextFormField(
                            controller: plateFilter,
                            decoration: new InputDecoration(
                              hintText: 'Please enter license plate',
                              labelText: 'Enter Your license plate',
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        Center(
                          child: Container(
                            child: new Stack(
                              children: <Widget>[
                                new Container(
                                  child: new Column(
                                    children: <Widget>[
                                      new RaisedButton(
                                        child: new Text('Create Account', style: TextStyle(color: Colors.amberAccent, fontSize: 20),),
                                        onPressed: loginPressed,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: new BorderRadius.circular(10.0)
                                        ),
                                        color: Colors.black,
                                        padding: const EdgeInsets.fromLTRB(40.0, 15.0, 40.0, 15.0),
                                      ),
                                      new FlatButton(
                                        padding: EdgeInsets.only(top: 25.0,bottom: 10.0),
                                        child: new Text('Have an account? Tap here to Login'),
                                        onPressed: formChange,
                                        splashColor: Colors.white10,
                                      ),
                                      new Container(
                                        padding: const EdgeInsets.only(bottom: 30.0),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]
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