import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});


final CollectionReference propertyCollection =
      FirebaseFirestore.instance.collection('properties');


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

        var userDocRef = await FirebaseFirestore.instance.collection('properties').doc(uid);
          var doc = await userDocRef.get();
          if (!doc.exists) {
            return FirebaseFirestore.instance.collection('properties').doc(uid).set({"properties": FieldValue.arrayUnion([details])});
          } else {
            return FirebaseFirestore.instance.collection('properties').doc(uid).update({"properties": FieldValue.arrayUnion([details])});
        }
        
      
  }
  
}
