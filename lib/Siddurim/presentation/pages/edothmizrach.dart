import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pray_together/siddurim/presentation/state_management/pdfviewer.dart';

class edotHamizrach extends StatelessWidget {
  const edotHamizrach({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Text('נוסח עדות המזרח'),
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
        body: Column(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  'תפילת שחרית',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pdfViewerShaharitEdot(),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  'תפילת מנחה',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pdfViewerMinchaEdot(),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  'תפילת ערבית',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pdfViewerArvitEdot(),
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: TextButton(
                child: Text(
                  'קריאת התורה',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontFamily: 'Guttman',
                    fontSize: 30,
                    color: Colors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => pdfViewerKriatHatorha(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
