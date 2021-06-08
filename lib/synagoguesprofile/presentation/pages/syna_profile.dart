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
                child: SizedBox(
                  height: 140,
                  child: Column(
                    children: [
                      Text(
                        'הרשמה לקפסולת תפילה:',
                        textDirection: TextDirection.rtl,
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
                                  get_Mincha_Capsule(widget.synagogues_User.uid,
                                      user_Name, widget.synagogues_User.name);
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
                                  get_Arvit_Capsule(widget.synagogues_User.uid,
                                      user_Name, widget.synagogues_User.name);
                                },
                              );
                            }
                          },
                        ),
                      ),

                      navLogos(
                        synagogues_User: widget.synagogues_User,
                        currentPos: currentPos,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
      child: Row(
        children: [
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
        ],
      ),
    );
  }
}
