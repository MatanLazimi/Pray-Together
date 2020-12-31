import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'askenaz.dart';
import 'edothmizrach.dart';
import 'sefard.dart';

class siddurim extends StatelessWidget {
  const siddurim({Key key}) : super(key: key);

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
          title: Text('סידורי תפילה'),
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
                height: 160,
                //width: ,
                child: Image.asset("lib/siddurim/core/imag_siddur.png"),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                child: Text(
                  'נוסח אשכנז',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => askenaz(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text('נוסח עדות המזרח',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    )),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => edotHamizrach(),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                child: Text(
                  'נוסח ספרד',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => sefard(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
