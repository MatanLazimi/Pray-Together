import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pray_together/siddurim/presentation/state_management/pdfviewer.dart';

class askenaz extends StatelessWidget {
  const askenaz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal[400],
          title: Text(
            'נוסח אשכנז',
            style: TextStyle(fontSize: 25, fontFamily: 'Guttman'),
            textDirection: TextDirection.rtl,
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
                      builder: (context) => pdfViewerShaharitAskenaz(),
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
                      builder: (context) => pdfViewerMinchaAskenaz(),
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
                      builder: (context) => pdfViewerArvitAskenaz(),
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
