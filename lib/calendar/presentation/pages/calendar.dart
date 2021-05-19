import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarWidget extends StatelessWidget {
  const calendarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
            initialSelectedDate: DateTime.now(),
            monthViewSettings: MonthViewSettings(
                monthCellStyle: MonthCellStyle(
                    backgroundColor: Color(0xFF293462),
                    trailingDatesBackgroundColor: Color(0xff216583),
                    leadingDatesBackgroundColor: Color(0xff216583),
                    todayBackgroundColor: Color(0xFFf7be16),
                    textStyle: TextStyle(fontSize: 12, fontFamily: 'Arial'),
                    // todayTextStyle: TextStyle(
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.bold,
                    //     fontFamily: 'Arial'),
                    trailingDatesTextStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontFamily: 'Arial'),
                    leadingDatesTextStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 12,
                        fontFamily: 'Arial'))),
          ),
        ),
      ),
    );
  }
}
