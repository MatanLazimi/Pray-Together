import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pray_together/pray_together.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(prayTogether());
}
