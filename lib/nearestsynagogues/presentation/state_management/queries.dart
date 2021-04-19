import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:pray_together/models/syn_user.dart';

Stream<List<DocumentSnapshot>> get_Nearest_Synagogues(Position pos) {
  GeoFirePoint current_Position =
      Geoflutterfire().point(latitude: pos.latitude, longitude: pos.longitude);

  var all_Synagogues = FirebaseFirestore.instance.collection('New_Synagogues');

  Stream<List<DocumentSnapshot>> stream = Geoflutterfire()
      .collection(collectionRef: all_Synagogues)
      .within(
          center: current_Position,
          radius: 0.5,
          field: 'position',
          strictMode: true);
  stream.listen((List<DocumentSnapshot> documentList) {
    print(documentList.length);
  });

  return stream;
}

/** Function for creating New collection, this function also called for: "create_New_Collection",
 * Use it only once!!!!
*/

void call_For_New_Collection() {
  //
  FirebaseFirestore.instance
      .collection('Synagogues')
      .get()
      .then((QuerySnapshot querySnapshot) {
    querySnapshot.docs.forEach((doc) {
      print(doc['Id']);
      String lat = doc['lat'];
      String lon = doc['lon'];
      create_New_Collection(lat, lon, doc.data());
    });
  });
  //
}

create_New_Collection(String lat, String lon, Map<String, dynamic> snap) {
  GeoFirePoint myLocation = Geoflutterfire()
      .point(latitude: double.parse(lat), longitude: double.parse(lon));
  FirebaseFirestore.instance.collection('New_Synagogues').add({
    'id': int.parse(snap['Id']),
    'name': snap['name'],
    'street': snap['street'],
    'houseNumber': snap['HouseNumbe'],
    'type': snap['type'],
    'gabayName': snap['gabayName'],
    'phone': snap['phone'],
    'position': myLocation.data
  });
}
