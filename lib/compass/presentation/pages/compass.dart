import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class Compass extends StatefulWidget {
  //since the direction keeps changing, so should the angle and the compass pointer, thus we use STFUL widget
  @override
  _CompassState createState() => new _CompassState();
}

class _CompassState extends State<Compass> {
  double _direction;

  @override
  void initState() {
    super.initState();
    FlutterCompass.events.listen((double direction) {
      if (mounted) {
        setState(() {
          _direction = direction;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CompassRed(direction: _direction),
    );
  }
}

class CompassRed extends StatelessWidget {
  const CompassRed({
    Key key,
    @required double direction,
  })  : _direction = direction,
        super(key: key);

  final double _direction;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.teal[400],
        title: Center(
          child: Text(
            'מצפן',
            style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              '     צפון - מתפללים לכיוון דרום      \nדרום - מתפללים לכיוון צפון מערב',
              style: TextStyle(fontSize: 22, fontFamily: 'Guttman'),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            alignment: Alignment.center,
            color: Colors.amber[50],
            child: Transform.rotate(
              // to get the angle deviation

              angle: ((_direction ?? 0) * (pi / 180) * -1),

              child: Image.asset('lib/compass/core/compass.png'),
            ),
          ),
        ],
      ),
    );
  }
}
