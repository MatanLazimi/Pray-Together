import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:geolocator/geolocator.dart';
import 'package:pray_together/calendar/presentation/pages/calendar.dart';
import 'package:pray_together/calendar/presentation/pages/dart_koser_cal.dart';
import 'package:pray_together/compass/presentation/pages/compass.dart';
import 'package:pray_together/compass/presentation/pages/compass1.dart';
import 'package:pray_together/login/presentation/state_management/login_provider.dart';
import 'package:pray_together/nearestsynagogues/presentation/pages/viewnearest.dart';
import 'package:pray_together/nearestsynagogues/presentation/state_management/queries.dart';
import 'package:pray_together/siddurim/presentation/pages/siddurim.dart';
import 'package:pray_together/synagoguesprofile/presentation/pages/syna_profile.dart';
import 'package:pray_together/synagoguesprofile/state_management/profile_help_functions.dart';
import 'package:provider/provider.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  Position cPosition;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          'מתפללים יחד',
          style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(
                Icons.account_circle,
                textDirection: TextDirection.rtl,
              ),
              hoverColor: Colors.amber[50],
              tooltip: 'התנתקות מהמערכת',
              onPressed: () async {
                Provider.of<LoginProvider>(context, listen: false)
                    .signOutGoogle();
                Navigator.pop(context);
              },
            ),
          ),
        ],
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[50],
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 176,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: Colors.teal[400],
                minimumSize: Size(160, 160),
              ),
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Text(
                  'מצא בתי-כנסת קרובים',
                  style: TextStyle(fontSize: 20, fontFamily: 'Guttman'),
                  textDirection: TextDirection.rtl,
                ),
              ),
              onPressed: () async {
                bool serviceEnabled;
                LocationPermission permission;

                serviceEnabled = await Geolocator.isLocationServiceEnabled();
                if (!serviceEnabled) {
                  return Future.error('Location services are disabled.');
                }

                permission = await Geolocator.checkPermission();
                if (permission == LocationPermission.deniedForever) {
                  return Future.error(
                      'Location permissions are permantly denied, we cannot request permissions.');
                }

                if (permission == LocationPermission.denied) {
                  permission = await Geolocator.requestPermission();
                  if (permission != LocationPermission.whileInUse &&
                      permission != LocationPermission.always) {
                    return Future.error(
                        'Location permissions are denied (actual value: $permission).');
                  }
                }
                cPosition = await Geolocator.getCurrentPosition(
                    desiredAccuracy: LocationAccuracy.best,
                    forceAndroidLocationManager: true);
                //getSynagogues(position);
                print('Lat:${cPosition.latitude}, Long:${cPosition.longitude}');
                cleanDB();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => find_Nearest_Synagogues(
                      position: cPosition,
                    ),
                  ),
                );
              },
            ),
          ),
          Center(
            child: Container(
              //color: Colors.amberAccent,
              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  IconButton(
                    icon: Icon(Icons.compass_calibration_outlined),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => compass_App(
                                  position: cPosition,
                                )),
                      );
                    },
                    iconSize: 25.0,
                    highlightColor: Colors.teal[400],
                  ),
                  IconButton(
                    icon: Icon(Icons.calendar_today),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => calendarWidget()),
                      );
                    },
                    iconSize: 25.0,
                    highlightColor: Colors.teal[400],
                  ),
                  IconButton(
                    icon: Icon(Icons.location_on),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => mainPage()),
                      // );
                    },
                    iconSize: 41.0,
                    highlightColor: Colors.teal[400],
                  ),
                  IconButton(
                    icon: Icon(Icons.auto_stories),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => siddurim()),
                      );
                    },
                    iconSize: 25.0,
                    highlightColor: Colors.teal[400],
                  ),
                  // IconButton(
                  //   icon: Icon(Icons.account_circle_outlined),
                  //   onPressed: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(builder: (context) => syna_profile(synagogues_User: synagogues_User)),
                  //     // );
                  //   },
                  //   iconSize: 25.0,
                  //   highlightColor: Colors.teal[400],
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
