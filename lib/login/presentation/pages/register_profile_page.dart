import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:pray_together/core/entities/user.dart';
import 'package:pray_together/login/core/login_failure.dart';
import 'package:pray_together/login/presentation/state_management/login_provider.dart';
import 'package:provider/provider.dart';

// ignore: camel_case_types
class RegisterProfilePage extends StatelessWidget {
  const RegisterProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text("register profile")],
        ),
      ),
    );
  }
}
