import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:pray_together/models/syn_user.dart';
import 'package:pray_together/nearestsynagogues/presentation/state_management/queries.dart';
import 'package:pray_together/synagoguesprofile/presentation/pages/syna_profile.dart';

class find_Nearest_Synagogues extends StatefulWidget {
  Position position;

  find_Nearest_Synagogues({
    Key key,
    @required this.position,
  }) : super(key: key);

  @override
  _find_Nearest_SynagoguesState createState() =>
      _find_Nearest_SynagoguesState();
}

class _find_Nearest_SynagoguesState extends State<find_Nearest_Synagogues> {
  final Geolocator geolocator = Geolocator();
  syn_User synagogues_User;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          'בתי כנסת קרובים',
          style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[50],
      body: StreamBuilder(
        stream: get_Nearest_Synagogues(widget.position),
        builder: (BuildContext context,
            AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          return !snapshot.hasData
              ? Text('There is no nearest Synagogues')
              : ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: Colors.teal[400],
                      color: Colors.amber[50],
                      child: ListTile(
                        onTap: () {
                          synagogues_User =
                              syn_User.fromDoc(snapshot.data[index]);
                          showProfile(context,
                              synagogues_User: synagogues_User);
                        },
                        title: Text(
                          '${snapshot.data[index].get('name')}',
                          style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
                          textDirection: TextDirection.rtl,
                        ),
                        subtitle: Text(
                            '${snapshot.data[index].get('street')}' +
                                ' ' +
                                '${snapshot.data[index].get('houseNumber')}' +
                                '\n' +
                                'נוסח: ' +
                                '${snapshot.data[index].get('type')}',
                            textDirection: TextDirection.rtl),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage("lib/core/assets/Tample3.png"),
                          radius: 45,
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

showProfile(BuildContext context, {syn_User synagogues_User}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => syna_profile(
        synagogues_User: synagogues_User,
      ),
    ),
  );
}
