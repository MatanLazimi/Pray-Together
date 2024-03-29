import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kosher_dart/kosher_dart.dart';

class HebrewCalendar extends StatefulWidget {
  HebrewCalendar({Key key}) : super(key: key);

  @override
  _HebrewCalendarState createState() => _HebrewCalendarState();
}

class _HebrewCalendarState extends State<HebrewCalendar> {
  JewishDate jewishDate = JewishDate();
  JewishCalendar jewishCalendar = JewishCalendar();
  HebrewDateFormatter hebrewDateFormatter = HebrewDateFormatter();

  @override
  void initState() {
    //hebrewDateFormatter.setHebrewFormat(true);
    //hebrewDateFormatter.setUseGershGershayim(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Text(
            'לוח שנה עברי',
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
        body: Container(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                heightFactor: 2,
                child: Text(
                    'תאריך עברי: ' + hebrewDateFormatter.format(jewishDate),
                    style: TextStyle(fontSize: 20)),
              ),
              Center(
                child: Text(
                    'פרשת השבוע: ' +
                        hebrewDateFormatter.formatWeeklyParsha(jewishCalendar),
                    style: TextStyle(fontSize: 20)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
