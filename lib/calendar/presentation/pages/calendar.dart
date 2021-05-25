import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calendarWidget extends StatelessWidget {
  const calendarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff216583),
          centerTitle: true,
          title: Text(
            'לוח שנה',
            style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
        ),
        body: Container(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: SfCalendar(
              view: CalendarView.month,
              showNavigationArrow: true,
              initialSelectedDate: DateTime.now(),
              monthViewSettings: MonthViewSettings(
                showAgenda: true,
                agendaViewHeight: 300,
                appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
                dayFormat: 'EEE',
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
                      fontFamily: 'Arial'),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
