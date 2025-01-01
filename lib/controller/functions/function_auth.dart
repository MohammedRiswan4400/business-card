import 'dart:developer';

import 'package:flux_mvp/controller/auth.dart';
import 'package:flux_mvp/core/constant/const.dart';
import 'package:flux_mvp/widgets/helper/dailoge_helper.dart';
import 'package:flux_mvp/widgets/main/snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/routes/screen_routes.dart';

// import 'package:google_sign_in/google_sign_in.dart';

class AuthFunctions {
  static Future createUserWithEmailAndPassword({
    required BuildContext ctx,
    required String email,
    required String password,
  }) async {
    try {
      DailogHelper.showDailog('Creating...');
      await Auth()
          .createUserWithEmailAndPassword(email: email, password: password);
      storage.write(isLogged, true);

      // ignore: use_build_context_synchronously
      ScreenRoutes.gotoScreenAuthProfile(ctx, email);
      DailogHelper.hideDailoge();
      log('SignUp Success');
    } on FirebaseAuthException catch (e) {
      DailogHelper.hideDailoge();
      SnackBarHelper.snackBarFaild(
        'Oops!',
        e.message,
      );
      log(e.message.toString());
    }
  }

  static Future signInWithEmailAndPassword({
    required BuildContext ctx,
    required String email,
    required String password,
  }) async {
    try {
      DailogHelper.showDailog('Login...');
      await Auth().signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      storage.write(isLogged, true);
      // ignore: use_build_context_synchronously
      ScreenRoutes.gotoScreenHome(ctx);
      DailogHelper.hideDailoge();
      log('Login Success');
    } on FirebaseAuthException catch (e) {
      DailogHelper.hideDailoge();
      SnackBarHelper.snackBarFaild(
        'Oops!',
        e.message,
      );
      log(e.message.toString());
    }
  }

  // static Future<User?> signInWithGoogle() async {
  //   final GoogleSignIn googleSignIn = GoogleSignIn();
  //   final FirebaseAuth auth = FirebaseAuth.instance;

  //   // Trigger Google Sign-In
  //   final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

  //   if (googleUser != null) {
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Sign in with Firebase
  //     final UserCredential userCredential =
  //         await auth.signInWithCredential(credential);

  //     return userCredential.user;
  //   }

  //   return null;
  // }

  static Future signOut(context) async {
    await Auth().signOut();

    storage.write(isLogged, false);
    storage.write(isProfile, false);
    ScreenRoutes.gotoScreenLogin(context);
    log('Sign out Success');
  }
}
