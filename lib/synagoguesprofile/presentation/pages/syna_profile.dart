import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pray_together/models/syn_user.dart';
import 'package:get/get.dart';
import 'package:pray_together/synagoguesprofile/state_management/profile_help_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class syna_profile extends StatefulWidget {
  syn_User synagogues_User;
  syna_profile({Key key, @required this.synagogues_User}) : super(key: key);

  @override
  _syna_profileState createState() => _syna_profileState();
}

class _syna_profileState extends State<syna_profile> {
  String user_Name = FirebaseAuth.instance.currentUser.displayName;
  Position currentPos;
  Future<bool> Shaharit_flag;
  Future<bool> Mincha_flag;
  Future<bool> Arvit_flag;

  @override
  void initState() {
    Shaharit_flag = is_Shaharit_List_Full(widget.synagogues_User.uid);
    Mincha_flag = is_Mincha_List_Full(widget.synagogues_User.uid);
    Arvit_flag = is_Arvit_List_Full(widget.synagogues_User.uid);
    super.initState();
    getCurrentLocation();
  }

  getCurrentLocation() {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        currentPos = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

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
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment(0.8, 0.8),
                    child: buildDetails(),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Align(
                    alignment: Alignment(0.8, 0.8),
                    child: buildImage(),
                  ),
                ],
              ),
              Center(
                child: navLogos(
                  synagogues_User: widget.synagogues_User,
                  currentPos: currentPos,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Align(
                    alignment: Alignment(0.8, 0.8),
                    child: Container(
                      child: SizedBox(
                        height: 140,
                        child: Column(
                          children: [
                            Text(
                              'הרשמה לקפסולת תפילה:',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: 'Guttman',
                                color: Colors.grey[700],
                                fontSize: 15,
                              ),
                            ),
                            Expanded(
                              child: FutureBuilder(
                                future: Shaharit_flag,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData && snapshot.data) {
                                    return ElevatedButton(
                                      child: Text('הרשמה לשחרית'),
                                      onPressed: null,
                                    );
                                  } else {
                                    return ElevatedButton(
                                      child: Text('הרשמה לשחרית'),
                                      onPressed: () {
                                        get_Shaharit_Capsule(
                                            widget.synagogues_User.uid,
                                            user_Name,
                                            widget.synagogues_User.name);
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            //Expand For Mincha:
                            Expanded(
                              child: FutureBuilder(
                                future: Mincha_flag,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData && snapshot.data) {
                                    return ElevatedButton(
                                      child: Text(' הרשמה למנחה'),
                                      onPressed: null,
                                    );
                                  } else {
                                    return ElevatedButton(
                                      child: Text(' הרשמה למנחה'),
                                      onPressed: () {
                                        get_Mincha_Capsule(
                                            widget.synagogues_User.uid,
                                            user_Name,
                                            widget.synagogues_User.name);
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            //Expand For Arvit:
                            Expanded(
                              child: FutureBuilder(
                                future: Arvit_flag,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData && snapshot.data) {
                                    return ElevatedButton(
                                      child: Text(' הרשמה לערבית'),
                                      onPressed: null,
                                    );
                                  } else {
                                    return ElevatedButton(
                                      child: Text(' הרשמה לערבית'),
                                      onPressed: () {
                                        get_Arvit_Capsule(
                                            widget.synagogues_User.uid,
                                            user_Name,
                                            widget.synagogues_User.name);
                                      },
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Align(
                    alignment: Alignment(0.8, 0.8),
                    child: zmaniTfila(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Name
  Widget buildDetails() {
    return Container(
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
          fontSize: 17,
        ),
      ),
    );
  }
}

// Build Image for syna:
Widget buildImage() {
  final image = AssetImage("lib/synagoguesprofile/core/imag_home.png");
  return ClipOval(
    child: Material(
      color: Colors.transparent,
      child: Ink.image(
        image: image,
        fit: BoxFit.cover,
        width: 128,
        height: 128,
      ),
    ),
  );
}

// Loach zmani tphila:
Widget zmaniTfila() {
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "זמני תפילה:",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            decoration: TextDecoration.underline,
            fontFamily: 'Guttman',
            color: Colors.grey[700],
            fontSize: 19,
          ),
        ),
        Text(
          "הנץ החמה:  05:48",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Guttman',
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
        Text(
          "תפילת שחרית:  07:15",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Guttman',
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
        Text(
          "תפילת מנחה:  18:50",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Guttman',
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
        Text(
          "שקיעה:  19:43",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Guttman',
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
        Text(
          "תפילת ערבית:  19:52",
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontFamily: 'Guttman',
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
      ],
    ),
  );
}

// Class for Navigate logos:
class navLogos extends StatelessWidget {
  final syn_User synagogues_User;
  final Position currentPos;
  const navLogos(
      {Key key, @required this.synagogues_User, @required this.currentPos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        children: [
          SizedBox(
            width: 50,
          ),
          IconButton(
            icon: Image.asset('lib/core/assets/logo_waze.png'),
            iconSize: 30,
            onPressed: () {
              launchWaze(currentPos, synagogues_User.position.latitude,
                  synagogues_User.position.longitude);
            },
          ),
          IconButton(
            icon: Image.asset('lib/core/assets/Google Maps logo.png'),
            iconSize: 30,
            onPressed: () {
              launchGoogleMaps(currentPos, synagogues_User.position.latitude,
                  synagogues_User.position.longitude);
            },
          ),
          SizedBox(
            width: 50,
          ),
          Text(
            "נווט לבית הכנסת:",
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontFamily: 'Guttman',
              color: Colors.grey[700],
              fontSize: 17,
            ),
          ),
        ],
      ),
    );
  }
}
