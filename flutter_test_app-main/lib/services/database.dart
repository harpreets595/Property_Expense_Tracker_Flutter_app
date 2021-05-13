import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/models/brew.dart';
import 'package:flutter_app/models/property.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  // final CollectionReference brewCollection =
  //     FirebaseFirestore.instance.collection('brews');

  // Future updateUserData(String sugars, String name, int strength) async {
  //   return await brewCollection
  //       .doc(uid)
  //       .set({'sugars': sugars, 'name': name, 'strength': strength});
  // }

final CollectionReference propertyCollection =
      FirebaseFirestore.instance.collection('properties');

  // DocumentReference docRef = FirebaseFirestore.instance.collection('properties').doc('uid');
  // DocumentSnapshot doc = await docRef.get();

  Future updatePropertyData(
      String propertyName,
      String propertyAddress,
      double mortgagePayment,
      double schoolTax,
      double municipalTax,
      double insurance,
      int numberOfUnits) async {
        



        // List details = new List();
        Map<String, dynamic> details =
                  {'propertyName' : propertyName,
                  'propertyAddress' : propertyAddress,
                  'mortgagePayment' : mortgagePayment,
                  'schoolTax' : schoolTax,
                  'municipalTax' : municipalTax,
                  'insurance' : insurance,
                  'numberOfUnits' : numberOfUnits
                  }; 
        
        // details.add(propertyName);
        // details.add(propertyAddress);
        // details.add(mortgagePayment);
        // details.add(schoolTax);
        // details.add(municipalTax);
        // details.add(insurance);
        // details.add(numberOfUnits);

        var userDocRef = await FirebaseFirestore.instance.collection('properties').doc(uid);
          var doc = await userDocRef.get();
          if (!doc.exists) {
            return FirebaseFirestore.instance.collection('properties').doc(uid).set({"properties": FieldValue.arrayUnion([details])});
          } else {
            return FirebaseFirestore.instance.collection('properties').doc(uid).update({"properties": FieldValue.arrayUnion([details])});
        }
        
        
      // if(FirebaseFirestore.instance.collection('properties').doc(uid) ){
      //   return FirebaseFirestore.instance.collection('properties').doc(uid).set({"properties": FieldValue.arrayUnion([details])});
        
      // }
    
      //else
        //return FirebaseFirestore.instance.collection('properties').doc(uid).update({"properties": FieldValue.arrayUnion([details])});
    

    // return await propertyCollection.doc(uid).push({
    //   'propertyName': propertyName,
    //   'propertyAddress': propertyAddress,
    //   'mortgagePayment': mortgagePayment,
    //   'schoolTax': schoolTax,
    //   'municipalTax': municipalTax,
    //   'insurance': insurance,
    //   'numberOfUnits': numberOfUnits
    // });
  }
  



  // brew list form snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc.data()['name'] ?? '',
          strength: doc.data()['strength'] ?? 0,
          sugars: doc.data()['sugars'] ?? 0);
    }).toList();
  }

  // get brews streams
  // Stream<List<Brew>> get brews {
  //   return brewCollection.snapshots().map(_brewListFromSnapshot);
  // }

  // get user doc stream
  // Stream<DocumentSnapshot> get userData{
  //   return brewCollection.doc(uid);
  // }

}
