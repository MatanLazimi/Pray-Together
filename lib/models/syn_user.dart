import 'package:cloud_firestore/cloud_firestore.dart';

class syn_User {
  final int id;
  final String uid;
  final String name;
  final String street;
  final String houseNumber;
  final String type;
  final String gabayName;
  final String phone;
  final GeoPoint position;

  syn_User({
    this.id,
    this.uid,
    this.name,
    this.street,
    this.houseNumber,
    this.type,
    this.gabayName,
    this.phone,
    this.position,
  });

  factory syn_User.fromDoc(DocumentSnapshot doc) {
    return syn_User(
      id: doc.data()['id'],
      uid: doc.id,
      name: doc.data()['name'],
      street: doc.data()['street'],
      houseNumber: doc.data()['houseNumber'],
      type: doc.data()['type'],
      gabayName: doc.data()['gabayName'],
      phone: doc.data()['phone'],
      //position: doc.data()['position']['gepoint'],
      position: doc.get(FieldPath(['position', 'geopoint'])),
    );
  }
}
