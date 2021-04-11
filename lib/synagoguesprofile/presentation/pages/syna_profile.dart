import 'package:flutter/material.dart';

class syna_profile extends StatefulWidget {
  const syna_profile({Key key}) : super(key: key);

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
            '<שם בית הכנסת>',
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
                height: 250,
                //width: ,
                child: Image.asset("lib/synagoguesprofile/core/imag_home.png"),
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                child: Text(
                  'נוסח',
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text('כתובת',
                    style: TextStyle(
                      fontFamily: 'Guttman',
                      color: Colors.white,
                      fontSize: 30,
                    )),
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text(
                  'שם הגבאי',
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {},
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text(
                  'טלפון/נייד',
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
