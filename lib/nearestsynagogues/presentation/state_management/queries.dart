import 'package:cloud_firestore/cloud_firestore.dart';

void getSynagogues() {
  //Position temp_position;
  String synagoguesDB =
      FirebaseFirestore.instance.collection('Synagogues').doc().get() as String;
  print(synagoguesDB);
}
