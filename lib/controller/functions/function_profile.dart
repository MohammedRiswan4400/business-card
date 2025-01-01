import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flux_mvp/core/constant/const.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/model/user_model.dart';
import 'package:flux_mvp/widgets/helper/dailoge_helper.dart';

class FunctionProfile {
  static Future<void> createProfile(
      {required BuildContext context, required UserModel userModel}) async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.email!;
    try {
      DailogHelper.showDailog('Profile creating...');
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('User Datas')
          .doc('Profile')
          .set(userModel.toMap());
      storage.write(isProfile, true);
      // ignore: use_build_context_synchronously
      ScreenRoutes.gotoScreenHome(context);
      DailogHelper.hideDailoge();
      log('Profile created successfully!');
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
    }
  }

  static Stream<UserModel?> readProfile() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      return Stream.empty(); // If no user is logged in, return an empty stream
    }
    String userId = user.email!;

    return FirebaseFirestore.instance
        .collection('Users')
        .doc(userId)
        .collection('User Datas')
        .doc('Profile')
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists) {
        return UserModel.fromMap(
            snapshot.data()!); // Convert Firestore data to UserModel
      }
      return null; // Return null if the document does not exist
    });
  }
}
