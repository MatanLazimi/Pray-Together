import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pray_together/login/presentation/pages/login_page.dart';
// TODO: Import the app that you want to test
import 'package:pray_together/main.dart' as app;

void main() {
  group('App Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("full app test", (tester) async {
      // TODO: execute the app.main() function
      app.main();
      // TODO: wait until the app has settled - settled mean that the frame from before does not changed anything
      await tester.pumpAndSettle();
      //TODO: create finders for email. password and login
      final loginbutton = find.byType(SignInButton).first;
      // TODO: Tap on the login button and wait till it settled
      await tester.tap(loginbutton);
      await tester.pumpAndSettle();
    });
  });
}
