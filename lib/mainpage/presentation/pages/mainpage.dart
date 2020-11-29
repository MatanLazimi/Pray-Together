import 'package:flutter/material.dart';

class mainPage extends StatelessWidget {
  const mainPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text('Pray Together'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 600,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: CircleBorder(),
                primary: Colors.amberAccent,
                minimumSize: Size(160, 160),
              ),
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Text(
                  'מצא בתי-כנסת קרובים',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              onPressed: () {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.compass_calibration_outlined),
                onPressed: () {},
                iconSize: 30.0,
              ),
              Icon(
                Icons.calendar_today,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                Icons.location_on,
                color: Colors.black,
                size: 55,
              ),
              Icon(
                Icons.book_sharp,
                color: Colors.black,
                size: 30,
              ),
              Icon(
                Icons.account_circle_outlined,
                color: Colors.black,
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
