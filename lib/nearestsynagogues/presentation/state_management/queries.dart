import 'package:cloud_firestore/cloud_firestore.dart';

Query filteredCollection = FirebaseFirestore.instance
    .collection('Synagogues')
    .where('lat', isEqualTo: '31.25');

Future<void> getSynagogues() async {
  //Position temp_position;
  //List<DocumentSnapshot> synagoguesDB = FirebaseFirestore.instance.collection('Synagogues').doc().get() as List<DocumentSnapshot>;
}
