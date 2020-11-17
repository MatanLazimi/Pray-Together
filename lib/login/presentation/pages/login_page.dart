import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pray_together/login/presentation/state_management/login_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class loginPage extends StatelessWidget {
  const loginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            logoHeader(),
            SizedBox(
              height: 200,
            ),
            signInWithGoogle(),
          ],
        ),
      ),
    );
  }
}

class signInWithGoogle extends StatelessWidget {
  const signInWithGoogle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      text: "Sign up with Google",
      onPressed: () {
        Provider.of<LoginProvider>(context, listen: false).signInWithGoogle();
      },
    );
  }
}

class logoHeader extends StatelessWidget {
  const logoHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      child: Image.asset("lib/core/assets/logo.png"),
    );
  }
}
