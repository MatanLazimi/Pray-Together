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
            //crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,

            children: [
              IconButton(
                icon: Icon(Icons.compass_calibration_outlined),
                onPressed: () {},
                iconSize: 25.0,
              ),
              IconButton(
                icon: Icon(Icons.calendar_today),
                onPressed: () {},
                iconSize: 25.0,
              ),
              IconButton(
                icon: Icon(Icons.location_on),
                onPressed: () {},
                iconSize: 41.0,
              ),
              IconButton(
                icon: Icon(Icons.book_sharp),
                onPressed: () {},
                iconSize: 25.0,
              ),
              IconButton(
                icon: Icon(Icons.account_circle_outlined),
                onPressed: () {},
                iconSize: 25.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
