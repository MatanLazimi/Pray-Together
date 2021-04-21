import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pray_together/models/syn_user.dart';

class syna_profile extends StatefulWidget {
  syn_User synagogues_User;
  syna_profile({Key key, @required this.synagogues_User}) : super(key: key);

  @override
  _syna_profileState createState() => _syna_profileState();
}

class _syna_profileState extends State<syna_profile> {
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
                      ' ${widget.synagogues_User.houseNumber},\nבאר שבע'
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
                    onPressed: () {},
                    child: Text('הרשמה לשחרית'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('הרשמה למנחה'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
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
