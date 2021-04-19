import 'package:cloud_firestore/cloud_firestore.dart';

class syn_user {
  final int id;
  final String uid;
  final String name;
  final double lat;
  final double lon;
  final String street;
  final int houseNumber;
  final String type;
  final String gabayName;
  final String phone;

  syn_user({
    this.id,
    this.uid,
    this.name,
    this.lat,
    this.lon,
    this.street,
    this.houseNumber,
    this.type,
    this.gabayName,
    this.phone,
  });

  factory syn_user.fromDoc(DocumentSnapshot doc) {
    return syn_user(
      id: doc['id'],
      uid: doc['uid'],
      name: doc['name'],
      lat: doc['lat'],
      lon: doc['lon'],
      street: doc['street'],
      houseNumber: doc['houseNumber'],
      type: doc['type'],
      gabayName: doc['gabayName'],
      phone: doc['phone'],
    );
  }
}
