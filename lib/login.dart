
//import libraries
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:validators/validators.dart';

//import pages
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

  // -------------------- VARIABLES AND METHODS -----------------------------------------------------------------------

  final db = Firestore.instance;

  // ------------ login variables ------------------------
  String email = "";
  String password = "";
  FormType form = FormType.login;

  final TextEditingController emailFilter = new TextEditingController();
  final TextEditingController passwordFilter = new TextEditingController();
  // ------------ register/create Account variables ------------------------

//  fields needed in a user account
//  userid
//  name
//  phone number
//  email
//  password
//  credit card number
//  user type


  String regName = "";
  String regAge = "";
  String regEmail = "";
  String regContactNumber = "";
  String regPassword = "";
  String confirmPassword = "";
//  String regInsurance = "";

  final TextEditingController regNameController = new TextEditingController();
  final TextEditingController regAgeController = new TextEditingController();
  final TextEditingController regEmailController = new TextEditingController();
  final TextEditingController regContactNumberController = new TextEditingController();
  final TextEditingController regPasswordController = new TextEditingController();
  final TextEditingController confirmPasswordController = new TextEditingController();


  LoginPageState() {
//    emailFilter.addListener(emailListen);
//    passwordFilter.addListener(passwordListen);
  }

//  void emailListen() {
//    if (emailFilter.text.isEmpty) {
//      email = "";
//    } else {
//      email = emailFilter.text;
//    }
//  }
//
//  void passwordListen() {
//    if (passwordFilter.text.isEmpty) {
//      password = "";
//    } else {
//      password = passwordFilter.text;
//    }
//  }

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

  void loginPressed () {
    print('The user wants to login with $email and $password');
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MapPage()),
    );
  }

  void createAccountPressed () async{
    this.regName = regNameController.text.toString();
    this.regAge = regAgeController.text.toString();
    this.regEmail = regEmailController.text.toString();
    this.regContactNumber = regContactNumberController.text.toString();
    this.regPassword = regPasswordController.text.toString();
    this.confirmPassword = confirmPasswordController.text.toString();

    if (validateCreateForm()) {
      DocumentReference ref = await db.collection('users').add({
        'name': '$regName',
        'age': '$regAge',
        'email': '$regEmail',
        'contact number': '$regContactNumber',
        'password' : '$regPassword',
        'credit card' : '',
        'user type' : 'customer',
      });
      formChange();
    }

  }

  bool validateCreateForm(){
    // this is only partial validation
    //TODO
    // Ensure email not already used
    // phone number format
    if (regName == "" || regName == null) {
      alert("Please enter your full name");
      return false;
    }
    else if (regName.length<6){
      alert("Full name must be more than 6 characters.");
      return false;
    }
    else if(!isAlpha(regName)){
        alert("Please enter alpha characters.");
        return false;
      }
      else
        if (regAge == "" || regAge == null) {
          alert("Please enter your age");
          return false;
        }
        else if(!isNumeric(regAge)){
            alert("Please enter a numberic value");
            return false;
          }
          else
            if (regEmail == "" || regEmail == null) {
              alert("Please enter your email address");
              return false;
            }
            else if (!isEmail(regEmail)){
              alert("Enter valid email.");
              return false;
            }
            else
              if (regContactNumber == "" || regContactNumber == null) {
                alert("Please enter your phone number");
                return false;
              }
              else
                if (regPassword == "" || regPassword == null) {
                  alert("Please enter a password");
                  return false;
                }
                else
                  if (confirmPassword == "" || confirmPassword == null) {
                    alert("Please confirm your password");
                    return false;
                  }
                  else if(regPassword!=confirmPassword){
                    alert("Passwords do not match.");
                    return false;
                  }
    return true;
  }

  void alert(String message){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: new Text("Unable to submit request"),
            content: new Text(message),
          );
        }
    );// end show alert dialog
  }

  void passwordReset () {
    print("The user wants a password reset request sent to $email");
  }

  //-------------------------------End of variables and methods ---------------------------------------------


  //-------------------------------UI ELEMENTS ---------------------------------------------

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
                      margin: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)
                      ),
                      child: new Wrap(
                        children: <Widget>[
                          Center(
                            child: Container(
                              child: new Stack(
                                children: <Widget>[
                                  buildCard()
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

  Widget buildCard() {
    if (form == FormType.login) {
      // ------------------------------------------Login card ------------------------------------------
      return new Container(
        child: new Column(
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
    }
    else { // otherwise form == FormType.register
      // ------------------------------------------Create Account card ----------------------------------
      return new Scrollbar(
          child:Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: new Column(
              children: <Widget>[
                Center(
                    child: new Container(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: new Text('Create Account', style: TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black,),
                        textAlign: TextAlign.justify,
                      ),
                    )
                ),
                new ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                  leading: const Icon(Icons.person),
                  title: new TextFormField(
                    controller: regNameController,
                    decoration: new InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Please enter your name',
                      labelText: 'Enter your full name',
                    ),
                  ),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                  leading: const Icon(Icons.person),
                  title: new TextFormField(
                    controller: regAgeController,
                    keyboardType: TextInputType.number,
                    decoration: new InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Please enter your age',
                      labelText: 'Enter your age',
                    ),
                  ),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                  leading: const Icon(Icons.person),
                  title: new TextFormField(
                    controller: regEmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: new InputDecoration(
                      fillColor: Colors.black,
                      hintText: 'Please enter email',
                      labelText: 'Enter Your Email address',
                    ),
                  ),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                  leading: const Icon(Icons.phone_android),
                  title: new TextFormField(
                    controller: regContactNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: new InputDecoration(
                      hintText: 'Please enter contact number',
                      labelText: 'Enter a phone number',
                    ),
                  ),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0.0),
                  leading: const Icon(Icons.lock),
                  title: new TextFormField(
                    controller: regPasswordController,
                    decoration: new InputDecoration(
                      hintText: 'Please enter password',
                      labelText: 'Create a password',
                    ),
                    obscureText: true,
                  ),
                ),
                new ListTile(
                  contentPadding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 10.0),
                  leading: const Icon(Icons.lock),
                  title: new TextFormField(
                    controller: confirmPasswordController,
                    decoration: new InputDecoration(
                      hintText: 'Please enter password',
                      labelText: 'Confirm password',
                    ),
                    obscureText: true,
                  ),
                ),
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
              ],
            ),
          )
      );
    }
  }
}
