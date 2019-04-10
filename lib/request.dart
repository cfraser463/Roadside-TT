//import libraries
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import pages
import 'eta.dart';

class RequestPage extends StatefulWidget {
  static String tag= 'request-page';
  @override
  _RequestPageState createState() => new _RequestPageState();
}

class _RequestPageState extends State<RequestPage> {

  // -------------------- VARIABLES AND METHODS -----------------------------------------------
  final db = Firestore.instance;

  //each request will have an id generated and stored by firebase. this will be used to read specific already made requests
  String requestID="";

  // used to populate the dropdown menu
  List<String> services= ['Accident', 'Car not starting', 'Dead Battery', 'Flat Tyre', 'No gas'];

  // variables which represent the fields of the form
  String nameText="Hard coded name";



  String contactNumberText="";
  String plateNumberText="";
  String serviceNeeded;
  bool transportValue = false;
  List locationList = new List();
//  bool _value1 = false;
//  bool _value2 = false;

  //we omitted the brackets '{}' and are using fat arrow '=>' instead, this is dart syntax
//  void _value1Changed(bool value) => setState(() => _value1 = value);
//  void _value2Changed(bool value) => setState(() => _value2 = value);
  void transportValueChanged(bool value) => setState(() => transportValue = value);

//  final nameTextController = TextEditingController();
  final contactNumberController = TextEditingController();
  final plateNumberController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
//    nameTextController.dispose();
    contactNumberController.dispose();
    plateNumberController.dispose();
    super.dispose();
  }

  // This function is called when the send request button is pressed
  void submitButtonPressed(){
//    this.nameText = nameTextController.text.toString();
    this.contactNumberText = contactNumberController.text.toString();
    this.plateNumberText = plateNumberController.text.toString();
    print("Submit is being called");
    locationList = getLocation();
    print("Test getlocation worked");
    createRequest();
    print("Test createResquest worked");

//    if(validateForm()){
//      createRequest();
////      print("Form is valid");
//
////      Navigator.push(
////        context,
////        MaterialPageRoute(builder: (context) => EtaPage()),
////      );
//    }// end if valid
//    else print("Form NOT valid");
  }// end submitButtonPressed

  // this ensures that all required fields are filled in before sending request
  bool validateForm(){
    if (contactNumberText == "" || contactNumberText == null) {
      alert("Please enter a contact number");
      return false;
    }
    else
    if (plateNumberText == "" || plateNumberText == null) {
      alert("Please enter license plate number");
      return false;
    }
    else
    if (serviceNeeded == null) {
      alert("Please select a service");
      return false;
    }
    return true;
  }

  //used to notify the user that fields ned to be filled in to send a request
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

  // This sends the form data to the database
  void createRequest() async {
    DocumentReference ref = await db.collection('requests').add({
      'name': '$nameText',
      'contact number': '$contactNumberText',
      'plate number': '$plateNumberText',
      'service': '$serviceNeeded',
      'transport requested': '$transportValue',
      'location' : '$locationList',
    });
    setState(() => this.requestID = ref.documentID);
  }

  // this function returns a list with latitude in list(0) and longitude in list(1)
  // in future this can be a bool function which just sets the global variable called location
  // so if called this can fail if there is an issue with getting the location from the phone
  List getLocation(){
    //Hard coded values have been used until we can access the mobiles location
    final double latitude = 10.626040;
    final double longitude = -61.353627;

    List locationCoordinates= new List();
    locationCoordinates.add(latitude);
    locationCoordinates.add(longitude);
    return locationCoordinates;
  }

  //-------------------------------End of variables and methods ---------------------------------------------


  //-------------------------------UI ELEMENTS ---------------------------------------------


  @override
  Widget build(BuildContext context) {
    Widget requestpage = new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            children: <Widget>[
              //phone number field
              new ListTile(
                leading: const Icon(Icons.phone,color: Colors.lightBlueAccent),
                title: new TextField(
                  controller: contactNumberController,
                  decoration: new InputDecoration(
                    hintText: "Phone No.",
                  ),
                ),
              ),

              // license plate number field
              new ListTile(
                leading: const Icon(Icons.directions_car,color: Colors.lightBlueAccent),
                title: new TextField(
                  controller: plateNumberController,
                  decoration: new InputDecoration(
                    hintText: "License Plate No.",
                  ),
                ),
              ),

              // container holding the dropdown menu
              new Container(
                padding: const EdgeInsets.fromLTRB(0, 30.0, 0, 10.0),
                child: new DropdownButton<String>(
                  hint: Text('Service Type',style: TextStyle(fontSize: 16),),
                  value: serviceNeeded,
                  items: services.map((String item) => new DropdownMenuItem<String>(
                    value: item,
                    child: new SizedBox(width: 300.0, height: 100.0, child: new Text(item, textAlign: TextAlign.center,)),
                  ))
                      .toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      serviceNeeded = newValue;
                    });
                  },
                ),
              ),

              // checkbox for user to state is transport is required
              new CheckboxListTile(
                value: transportValue,
                onChanged: transportValueChanged,
                title: new Text('Do you need transport?'),
                controlAffinity: ListTileControlAffinity.leading,
//                subtitle: new Text('Subtitle'),
//                secondary: new Icon(Icons.directions_car,color: Colors.lightBlueAccent),
                activeColor: Colors.red,
              ),

              //Form submission button
              new RaisedButton(
                onPressed: () {
                  submitButtonPressed();
                },
                child: const Text('Send request',
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