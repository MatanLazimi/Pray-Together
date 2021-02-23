import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:pray_together/core/entities/user.dart';
import 'package:pray_together/login/core/login_failure.dart';
import 'package:pray_together/login/presentation/pages/register_profile_page.dart';
import 'package:pray_together/mainpage/presentation/pages/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginProvider with ChangeNotifier {
  final FirebaseAuth _auth;
  final GoogleSignIn googleSignIn;
  PrayerUser currentLoggedInUser = PrayerUser();
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  LoginProvider()
      : _auth = FirebaseAuth.instance,
        googleSignIn =
            GoogleSignIn(); //Our constractor is empty so we put ';' instead of '{}'

  Future<Either<PrayerUser, LoginFailure>> _signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    UserCredential authResult;
    User user;
    if (_auth.currentUser == null) {
      authResult = await _auth.signInWithCredential(credential);
      user = authResult.user;
    } else {
      user = _auth.currentUser;
    }

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      currentLoggedInUser.uid = user.uid;
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(user.uid)
          .set({'firstName': user.displayName});

      print('signInWithGoogle succeeded: $user');

      return Left(currentLoggedInUser);
    }

    return Right(LoginFailure());
  }

  Future signInWithGoogle() async {
    Either<PrayerUser, LoginFailure> result = await _signInWithGoogle();

    result.fold(
      (PrayerUser user) {
        navigatorKey.currentState.push(
          MaterialPageRoute(
            builder: (context) => mainPage(),
          ),
        );
      },
      (LoginFailure) {},
    );
  }

  void signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }
}
