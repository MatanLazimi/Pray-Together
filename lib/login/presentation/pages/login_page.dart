import 'package:custom_navigator/custom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pray_together/login/presentation/state_management/login_provider.dart';
import 'package:provider/provider.dart';

import 'email_login.dart';

// ignore: camel_case_types
class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomNavigator(
      // CustomNavigator is from the library 'custom_navigator'
      navigatorKey: Provider.of<LoginProvider>(context, listen: false)
          .navigatorKey, // Give the second key to your CustomNavigator
      pageRoute: PageRoutes.materialPageRoute,
      home: Scaffold(
        backgroundColor: Colors.teal[400],
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              logoHeader(),
              Text(
                "Pray Together",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Guttman',
                    color: Colors.amber[50]),
              ),
              SizedBox(
                height: 200,
              ),
              LoginWithGoogle(),
              SizedBox(
                height: 10,
              ),
              Text(
                "_________OR_________",
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Guttman',
                    color: Colors.amber[50]),
              ),
              SizedBox(
                height: 10,
              ),
              mailAndPassword(),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginWithGoogle extends StatelessWidget {
  const LoginWithGoogle({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Google,
      elevation: 5,
      text: "Sign-in with Google",
      onPressed: () async {
        await Provider.of<LoginProvider>(context, listen: false)
            .signInWithGoogle();
      },
    );
  }
}

class mailAndPassword extends StatelessWidget {
  const mailAndPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.Email,
      elevation: 5,
      text: "Sign In With Email",
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => email_login(),
          ),
        );
      },
    );
  }
}

// ignore: camel_case_types
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
