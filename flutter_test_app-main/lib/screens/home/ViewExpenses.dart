import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ViewExpenses extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    final appTitle = "Property Details";

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
          body: new Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.apartment),
                                title: Text('Property Name:'),
                                subtitle: Text('Property Address: '),
                              ),
                              
                            ],
                          ),
                        ),
      
          
        ),
    );
  }
}