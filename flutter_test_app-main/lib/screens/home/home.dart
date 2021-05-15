import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/ViewProperties.dart';
import 'package:flutter_app/services/auth.dart';
import 'NewProperty.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.brown[50],
      appBar: AppBar(
        title: Text('Property Expense Tracker'),
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('Logout')),          
        ],
      ),
      body: Center(
        child: Column(            
        children: [
          SizedBox(height: 250),
          ElevatedButton.icon(
            label: Text('Add a New Property'),
            icon: Icon(Icons.apartment),
            onPressed: () {
              print('Pressed');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NewProperty()));
            },
          ),
          SizedBox(height: 20),
          ElevatedButton.icon(
            label: Text('View Your Properties'),
            icon: Icon(Icons.web),
            onPressed: () async {
              //  DocumentSnapshot variable = await FirebaseFirestore.instance.collection('properties').doc(AuthService().currentUser()).get();
              //   print(variable['properties']);
              // print('Pressed');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ViewProperties()));
            },
          )
        ],
      )),
    ));
  }
}
