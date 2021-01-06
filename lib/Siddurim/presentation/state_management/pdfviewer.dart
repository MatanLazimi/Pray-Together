import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

/* 
  This class is for Mincha Askenaz 
*/
class pdfViewerMinchaAskenaz extends StatelessWidget {
  const pdfViewerMinchaAskenaz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת מנחה - נוסח אשכנז'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Askenaz_Mincha.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* 

*/
class pdfViewerArvitAskenaz extends StatelessWidget {
  const pdfViewerArvitAskenaz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת ערבית - נוסח אשכנז'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Askenaz_Arvit.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* 

*/
class pdfViewerShaharitAskenaz extends StatelessWidget {
  const pdfViewerShaharitAskenaz({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת שחרית - נוסח אשכנז'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Askenaz_Shaharit.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* 
 
*/
class pdfViewerShaharitEdot extends StatelessWidget {
  const pdfViewerShaharitEdot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת שחרית - נוסח עדות המזרח'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Edot_Shaharit.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* 

*/
class pdfViewerMinchaEdot extends StatelessWidget {
  const pdfViewerMinchaEdot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת מנחה - נוסח עדות המזרח'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Edot_Mincha.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/*

*/
class pdfViewerArvitEdot extends StatelessWidget {
  const pdfViewerArvitEdot({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת ערבית - נוסח עדות המזרח'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Edot_Arvit.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* 

*/
class pdfViewerShaharitSefard extends StatelessWidget {
  const pdfViewerShaharitSefard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת שחרית - נוסח ספרד'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Sefard_Shaharit.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* */
class pdfViewerMinchaSefard extends StatelessWidget {
  const pdfViewerMinchaSefard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת מנחה - נוסח ספרד'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Sefard_Mincha.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/* */
class pdfViewerArvitSefard extends StatelessWidget {
  const pdfViewerArvitSefard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('תפילת ערבית - נוסח ספרד'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Sefard_Arvit.pdf',
          canShowPaginationDialog: false,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}

/*
  This Class is for Krihaat Hatorha for Mon and Tuh
 */
class pdfViewerKriatHatorha extends StatelessWidget {
  const pdfViewerKriatHatorha({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('קריאת התורה לשני וחמישי'),
          backgroundColor: Colors.teal[400],
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SfPdfViewer.asset(
          'lib/siddurim/core/pdf/Kriat Hatorah.pdf',
          canShowPaginationDialog: false,
          canShowScrollHead: true,
          initialScrollOffset: Offset(0, 500),
        ),
      ),
    );
  }
}
