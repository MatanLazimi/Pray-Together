import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;
import 'package:pray_together/models/syn_user.dart';

/////////////////////////////////////////// Help Functions: ////////////////////////////////////////////////////

// Sign-In to Shaharit pray:
get_Shaharit_Capsule(String syn_Uid, String user_Name, String syn_Name) async {
  List<dynamic> shaharit_Capsule = [];

  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();

  if (!doc.exists) {
    doc_Ref.set({
      ' Syn_Name': syn_Name,
      ' Created': FieldValue.serverTimestamp(),
      'Shaharit': FieldValue.arrayUnion([]),
      'Mincha': FieldValue.arrayUnion([]),
      'Arvit': FieldValue.arrayUnion([]),
    });
  } // Here we creating the Doc if is not exist yet
  doc = await doc_Ref.get();
  shaharit_Capsule = doc.data()['Shaharit'];
  if ((shaharit_Capsule.length == 0 || shaharit_Capsule.length <= 11)) {
    if (!shaharit_Capsule.contains(user_Name)) {
      doc_Ref.update({
        'Shaharit': FieldValue.arrayUnion([user_Name])
      });
      shaharit_Capsule = doc.data()['Shaharit'];
    }
  } else if (shaharit_Capsule.length > 11) {
    Get.dialog(
      SimpleDialog(
        title: Text('AlertDialog Title'),
        children: [
          Text('הרשימה מלאה'),
          Text('מצטערים'),
        ],
      ),
    );
  }
}

// Sign-In to Mincha pray:
get_Mincha_Capsule(String syn_Uid, String user_Name, String syn_Name) async {
  List<dynamic> mincha_Capsule = [];

  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();

  if (!doc.exists) {
    doc_Ref.set({
      ' Syn_Name': syn_Name,
      ' Created': FieldValue.serverTimestamp(),
      'Shaharit': FieldValue.arrayUnion([]),
      'Mincha': FieldValue.arrayUnion([]),
      'Arvit': FieldValue.arrayUnion([]),
    });
  } // Here we creating the Doc if is not exist yet
  doc = await doc_Ref.get();
  mincha_Capsule = doc.data()['Mincha'];
  if ((mincha_Capsule.length == 0 || mincha_Capsule.length <= 11)) {
    if (!mincha_Capsule.contains(user_Name)) {
      doc_Ref.update({
        'Mincha': FieldValue.arrayUnion([user_Name])
      });
      mincha_Capsule = doc.data()['Mincha'];
    }
  } else if (mincha_Capsule.length > 11) {
    Get.dialog(
      SimpleDialog(
        title: Text('AlertDialog Title'),
        children: [
          Text('הרשימה מלאה'),
          Text('מצטערים'),
        ],
      ),
    );
  }
}

// Sign-In to Arvit pray:
get_Arvit_Capsule(String syn_Uid, String user_Name, String syn_Name) async {
  List<dynamic> arvit_Capsule = [];

  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();

  if (!doc.exists) {
    doc_Ref.set({
      ' Syn_Name': syn_Name,
      ' Created': FieldValue.serverTimestamp(),
      'Shaharit': FieldValue.arrayUnion([]),
      'Mincha': FieldValue.arrayUnion([]),
      'Arvit': FieldValue.arrayUnion([]),
    });
  } // Here we creating the Doc if is not exist yet
  doc = await doc_Ref.get();
  arvit_Capsule = doc.data()['Arvit'];
  if ((arvit_Capsule.length == 0 || arvit_Capsule.length <= 11)) {
    if (!arvit_Capsule.contains(user_Name)) {
      doc_Ref.update({
        'Arvit': FieldValue.arrayUnion([user_Name])
      });
      arvit_Capsule = doc.data()['Arvit'];
    }
  } else if (arvit_Capsule.length > 11) {}
}

//Get the Current time (Local Time)
get_Current_Time() {
  final String formattedDateTime =
      intl.DateFormat('dd-MM-yyyy \n kk:mm').format(DateTime.now()).toString();
  String timeFromatted = intl.DateFormat.Hm().format(DateTime.now()).toString();
  print(timeFromatted);
  print(formattedDateTime);
  return timeFromatted;
}

//check if the list is full:
Future<bool> is_Shaharit_List_Full(String syn_Uid) async {
  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();
  if (!doc.exists) {
    return false;
  } else {
    List<dynamic> list = doc.data()['Shaharit'];
    if (list.length > 11) {
      return true;
    } else {
      return false;
    }
  }
}

//check if the list is full:
Future<bool> is_Mincha_List_Full(String syn_Uid) async {
  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();
  if (!doc.exists) {
    return false;
  } else {
    List<dynamic> list = doc.data()['Mincha'];
    if (list.length > 11) {
      return true;
    } else {
      return false;
    }
  }
}

//check if the list is full:
Future<bool> is_Arvit_List_Full(String syn_Uid) async {
  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();
  if (!doc.exists) {
    return false;
  } else {
    List<dynamic> list = doc.data()['Arvit'];
    if (list.length > 11) {
      return true;
    } else {
      return false;
    }
  }
}

// delete docs for prayers:
void cleanDB() {
  DateTime currentDate = DateTime.now();
  DateTime midnightTime =
      DateTime(currentDate.year, currentDate.month, currentDate.day, 0, 0);
  //Convert the Date to Timestamp
  Timestamp midnightTimestamp = Timestamp.fromDate(midnightTime);

  Query doc_Ref = FirebaseFirestore.instance
      .collection('Capsules')
      .where(' Created', isLessThan: midnightTimestamp);

  doc_Ref.get().then((value) {
    value.docs.forEach((element) {
      FirebaseFirestore.instance
          .collection('Capsules')
          .doc(element.id)
          .delete()
          .then((value) => print("Doc Deleted"));
    });
  });
}
