import 'package:flutter/material.dart';
import 'package:flutter_app/services/database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../services/auth.dart';
import '../../services/database.dart';
import '../../services/database.dart';

class ViewProperties extends StatefulWidget {
  @override
  _ViewPropertiesState createState() => _ViewPropertiesState();
}

class _ViewPropertiesState extends State<ViewProperties> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('properties');

  Future getUsersList() async {
    DocumentSnapshot variable = await FirebaseFirestore.instance
        .collection('properties')
        .doc(AuthService().currentUser())
        .get();

    // for(var i in variable['properties']){
    //   print(i.get());
    // }

    //print(variable['properties']);
    // List itemsList = [];

    // await users.doc().get().then((QuerySnapshot){
    //   querySnapshot.documents.forEach((element) {
    //     itemsList.add(element.data);
    //   });
    // });
  }

  // Future getPost() async{
  //   var firestore = FirebaseFirestore.instance;
  //   DocumentReference doc = await firestore.collection('properties').doc(AuthService().currentUser());
  //   // DatabaseService(uid: AuthService().currentUser());
  //   print('-------------------------------------helllllllllo');
  //   print(doc.toString());
  //   print('hemennnnnnnnnnnnnnnd');

  // }

  @override
  Widget build(BuildContext context) {
    final appTitle = 'Add a New Property';

    // var dc = getUsersList();

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
          backgroundColor: Colors.brown[100],
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.brown[400],
            title: Text(appTitle),
          ),
          body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('properties').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData){
                return Text('no value');
              }
              return ListView(
                children: snapshot.data.docs.map((document) {
                    print('hellllllllllllllllllllllllllllloooooooooooooooooo');
                    print(document['properties'][0]);
                    return Text(document['properties'][0]['propertyName']);
                }).toList(),
              );
            }


          )
        ),
    );
  }

  // Container ListProperties() async {
  //   DocumentSnapshot variable = await FirebaseFirestore.instance
  //       .collection('properties')
  //       .doc(AuthService().currentUser())
  //       .get();

  //   return Container(child: Text(variable["properties"][0]));
  // }

  // DocumentSnapshot documentSnapshot() async{
  //   DocumentSnapshot variable = await FirebaseFirestore.instance
  //       .collection('properties')
  //       .doc(AuthService().currentUser())
  //       .get();

  //       return variable;
  // }
}
