import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kosher_dart/astronomical_calendar.dart';
import 'package:kosher_dart/complex_zmanim_calendar.dart';
import 'package:kosher_dart/hebrewcalendar/daf.dart';
import 'package:kosher_dart/hebrewcalendar/hebrew_date_formatter.dart';
import 'package:kosher_dart/hebrewcalendar/jewish_calendar.dart';
import 'package:kosher_dart/hebrewcalendar/jewish_date.dart';
import 'package:kosher_dart/hebrewcalendar/yerushalmi_yomi_calculator.dart';
import 'package:kosher_dart/hebrewcalendar/yomi_calculator.dart';
import 'package:kosher_dart/util/astronomical_calculator.dart';
import 'package:kosher_dart/util/geo_Location.dart';
import 'package:kosher_dart/util/geo_location_utils.dart';
import 'package:kosher_dart/util/noaa_calculator.dart';
import 'package:kosher_dart/util/sun_times_calculator.dart';
import 'package:kosher_dart/util/time.dart';
import 'package:kosher_dart/util/zman.dart';
import 'package:kosher_dart/zmanim_calendar.dart';

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
    hebrewDateFormatter.setHebrewFormat(true);
    hebrewDateFormatter.setUseGershGershayim(true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amberAccent,
          title: Text('לוח שנה עברי'),
          centerTitle: true,
        ),
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
