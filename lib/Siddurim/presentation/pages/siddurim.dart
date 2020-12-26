import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class siddurim extends StatelessWidget {
  const siddurim({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amberAccent,
            title: Text('סידורי תפילה'),
            centerTitle: true,
          ),
        ));
  }
}
