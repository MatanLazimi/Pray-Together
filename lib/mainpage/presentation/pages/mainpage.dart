import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pray_together/calendar/presentation/pages/calendar.dart';
import 'package:pray_together/compass/presentation/pages/compass.dart';
import 'package:pray_together/siddurim/presentation/pages/siddurim.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[400],
        title: Text(
          'מתפללים יחד',
          style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber[50],
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 137,
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
              onPressed: () {},
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
                        MaterialPageRoute(builder: (context) => Compass()),
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
                            builder: (context) => HebrewCalendar()),
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
                  IconButton(
                    icon: Icon(Icons.account_circle_outlined),
                    onPressed: () {},
                    iconSize: 25.0,
                    highlightColor: Colors.teal[400],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
