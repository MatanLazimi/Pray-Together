import 'package:flutter/material.dart';
import 'package:pray_together/login/presentation/pages/login_page.dart';
import 'package:pray_together/login/presentation/state_management/login_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class prayTogether extends StatelessWidget {
  final GlobalKey<NavigatorState> _mainNavigatorKey =
      GlobalKey<NavigatorState>();
  prayTogether({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
      ],
      child: MaterialApp(
        navigatorKey: _mainNavigatorKey,
        theme: ThemeData.light(),
        home: LoginPage(),
      ),
    );
  }
}
