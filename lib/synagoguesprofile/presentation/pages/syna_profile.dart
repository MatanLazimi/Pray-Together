import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pray_together/models/syn_user.dart';
//import 'package:intl/intl.dart';
import 'package:get/get.dart';

class syna_profile extends StatefulWidget {
  syn_User synagogues_User;
  syna_profile({Key key, @required this.synagogues_User}) : super(key: key);

  @override
  _syna_profileState createState() => _syna_profileState();
}

class _syna_profileState extends State<syna_profile> {
  String user_Name = FirebaseAuth.instance.currentUser.displayName;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.teal[400],
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Text(
            '${widget.synagogues_User.name}',
            style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Colors.amber[50],
        body: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                height: 150,
                //width: ,
                child: Image.asset("lib/synagoguesprofile/core/imag_home.png"),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Text(
                  'שם הגבאי: ${widget.synagogues_User.gabayName}' +
                      '\n' +
                      'נייד: ${widget.synagogues_User.phone}' +
                      '\n' +
                      'נוסח: ${widget.synagogues_User.type}' +
                      '\n' +
                      'כתובת: ${widget.synagogues_User.street}' +
                      ' ${widget.synagogues_User.houseNumber},\nבאר שבע' +
                      '\n',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    color: Colors.grey[700],
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      get_Shaharit_Capsule(
                          widget.synagogues_User.uid, user_Name);
                    }, //for disable button we can do short if
                    child: Text('הרשמה לשחרית'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      get_Mincha_Capsule(widget.synagogues_User.uid, user_Name);
                    },
                    child: Text('הרשמה למנחה'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      get_Arvit_Capsule(widget.synagogues_User.uid, user_Name);
                    },
                    child: Text('הרשמה לערבית'),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

/////////////////////////////////////////// Help Functions: ////////////////////////////////////////////////////

// Sign-In to Shaharit pray:
get_Shaharit_Capsule(String syn_Uid, String user_Name) async {
  List<dynamic> shaharit_Capsule = [];

  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();

  if (!doc.exists) {
    doc_Ref.set({
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
get_Mincha_Capsule(String syn_Uid, String user_Name) async {
  List<dynamic> mincha_Capsule = [];

  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();

  if (!doc.exists) {
    doc_Ref.set({
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
get_Arvit_Capsule(String syn_Uid, String user_Name) async {
  List<dynamic> arvit_Capsule = [];

  DocumentReference doc_Ref =
      FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
  DocumentSnapshot doc = await doc_Ref.get();

  if (!doc.exists) {
    doc_Ref.set({
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
      DateFormat('dd-MM-yyyy \n kk:mm').format(DateTime.now()).toString();
  print(formattedDateTime);
}

// //check if the list is full:
// is_Shaharit_List_Full(String syn_Uid) async {
//   DocumentReference doc_Ref =
//       FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
//   DocumentSnapshot doc = await doc_Ref.get();
//   if (!doc.exists) {
//     return false;
//   } else {
//     List<dynamic> list = doc.data()['Shaharit'];
//     if (list.length > 11) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

// //check if the list is full:
// is_Mincha_List_Full(String syn_Uid) async {
//   DocumentReference doc_Ref =
//       FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
//   DocumentSnapshot doc = await doc_Ref.get();
//   if (!doc.exists) {
//     return false;
//   } else {
//     List<dynamic> list = doc.data()['Mincha'];
//     if (list.length > 11) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

// //check if the list is full:
// is_Arvit_List_Full(String syn_Uid) async {
//   DocumentReference doc_Ref =
//       FirebaseFirestore.instance.collection('Capsules').doc(syn_Uid);
//   DocumentSnapshot doc = await doc_Ref.get();
//   if (!doc.exists) {
//     return false;
//   } else {
//     List<dynamic> list = doc.data()['Arvit'];
//     if (list.length > 11) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }
