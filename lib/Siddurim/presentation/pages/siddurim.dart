import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class siddurim extends StatelessWidget {
  const siddurim({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.amberAccent,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text('סידורי תפילה'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("lib\siddurim\core\imag_siddur.png"),
              ),
              ElevatedButton(
                  child: Text(
                    'נוסח אשכנזי',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  onPressed: () {}),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: Text('נוסח עדות המזרח',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                      )),
                  onPressed: () {}),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                  child: Text(
                    'נוסח ספרד',
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
