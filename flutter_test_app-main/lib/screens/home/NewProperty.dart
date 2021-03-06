
import 'package:flutter/material.dart';
import 'package:flutter_app/models/property.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../../shared/constants.dart';
import 'home.dart';

class NewProperty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add a New Property';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  String propertyName;
  String propertyAddress;
  double mortgagePayment;
  double schoolTax;
  double municipalTax;
  double insurance;
  int numberOfUnits;

  

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      
      child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Property Name'),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a Property Name';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => propertyName = val );
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Property Address'),
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Property Address';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => propertyAddress = val );
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Mortgage Payment'),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Mortgage Payment';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => mortgagePayment = double.parse(val));
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'School Tax'),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter School Tax';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => schoolTax = double.parse(val));
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Municipal Tax'),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Municipal Tax';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => municipalTax = double.parse(val));
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Insurance'),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Insurance';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => insurance = double.parse(val));
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              decoration: textInputDecoration.copyWith(hintText: 'Number of Units'),
              keyboardType: TextInputType.number,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the Number of Units';
                }
                return null;
              },
              onChanged: (val) {
                setState(() => numberOfUnits = int.parse(val));
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.pink[400]),
                onPressed: () {
                  
                  // Validate returns true if the form is valid, or false otherwise.
                  if (_formKey.currentState.validate()) {
                    // print(propertyName);
                    // print(propertyAddress);
                    // print(mortgagePayment);
                    // print(schoolTax);
                    // print(municipalTax);
                    // print(insurance);
                    // print(numberOfUnits);
                    Property property = new Property(propertyName, propertyAddress, mortgagePayment, schoolTax, municipalTax, insurance, numberOfUnits);
                    print(property.propertyName);
                   
                    DatabaseService(uid: AuthService().currentUser()).updatePropertyData(property.propertyName, property.propertyAddress, property.mortgagePayment, property.schoolTax, property.municipalTax, property.insurance, property.numberOfUnits);
                   
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Added Property Successfully')));

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  }
                },
                child: Text('Add This Property'),
                
              ),
            ),
          ],
        ),
      ),
    );
  }
}