import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../../services/database.dart';
import 'ViewExpenses.dart';

class ViewProperties extends StatefulWidget {
  @override
  _ViewPropertiesState createState() => _ViewPropertiesState();
}

class _ViewPropertiesState extends State<ViewProperties> {
  final CollectionReference propertiesRef =
      FirebaseFirestore.instance.collection('properties');


  bool deletedOnce = false;

  @override
  Widget build(BuildContext context) {
    final appTitle = 'All Properties';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.brown[400],
            title: Text(appTitle),
          ),
          body: Container(
            child: FutureBuilder<DocumentSnapshot>(
              
              future: propertiesRef.doc(AuthService().currentUser()).get(),
              builder:
                (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  print("okkkkk");
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                
                if (snapshot.hasData && !snapshot.data.exists) {
                  return Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data();
                  
                  var properties = data['properties'].map<Widget>(  (res) {
                        return new Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.apartment),
                                title: Text('Property Name: ${res['propertyName']}'),
                                subtitle: Text('Property Address: ${res['propertyAddress']}'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  TextButton(
                                    child: const Text('Delete Property'),
                                    onPressed: () async {
                                      
                                       await propertiesRef.doc(AuthService().currentUser()).update({
                                         "properties": FieldValue.arrayRemove([res])
                                       }).then((value) => print("User Updated"))
                                        .catchError((error) => print("Failed to update user: $error"));
                                      Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => super.widget));
                                    },
                              
                                  ),
                                  const SizedBox(width: 8),
                                  TextButton(
                                    child: const Text('View Expenses'),
                                    onPressed: () {Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) => ViewExpenses()));},
                                  ),
                                  const SizedBox(width: 8),
                                ],
                              ),
                            ],
                          ),
                        );
                  }).toList();
                  
                  return ListView.builder(
                    
                    padding: const EdgeInsets.all(8),
                    itemCount: properties.length,
                    itemBuilder: (BuildContext context, int index) {
                      return properties[index];
                    }                    
                  );                              
                }
                
                //return Text("loading");
                
              },
                            
            ),
            
          ),
          
        ),
    );
  }
}
