// ignore_for_file: use_build_context_synchronously, duplicate_ignore, deprecated_member_use

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/helper/dailoge_helper.dart';
import 'package:flux_mvp/widgets/main/snack_bar.dart';
import 'package:share_plus/share_plus.dart';

class FunctionCards {
  //Create Cards
  static Future<void> createCards({
    required BuildContext context,
    required CardModel cardModel,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.email!;
    try {
      DailogHelper.showDailog('Card creating...');
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Cards')
          .doc(cardModel.cardID)
          .set(cardModel.toMap());
      DailogHelper.hideDailoge();
      SnackBarHelper.snackBarFaild('Success', 'Card Creation Success');
      // ignore: use_build_context_synchronously
      ScreenRoutes.popNow(context);
      // ignore: use_build_context_synchronously
      createAllCard(context: context, cardModel: cardModel);

      log('Card created successfully!');
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
    }
  }

  static Future<void> updateCardIsSaved({
    required BuildContext context,
    required String cardID,
    required bool isSaved,
  }) async {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.email!;

    try {
      DailogHelper.showDailog('Updating card...');
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Cards')
          .doc(cardID)
          .update({'isSaved': isSaved});
      DailogHelper.hideDailoge();
      SnackBarHelper.snackBarSuccess('Success', 'Card updated successfully');
      DailogHelper.hideDailoge();

      log('Card isSaved value updated successfully!');
    } on FirebaseException catch (e) {
      DailogHelper.hideDailoge();
      DailogHelper.shoeErrorDailog(description: e.message);
    } catch (e) {
      DailogHelper.hideDailoge();
      DailogHelper.shoeErrorDailog(description: 'Something went wrong');
      log('Error updating card: $e');
    }
  }

  static Future<void> saveCard(CardModel card) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
            code: 'no-user', message: 'No user is logged in.');
      }
      final savedCardsRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .collection('SavedCards');
      await savedCardsRef.doc(card.cardID).set(card.toMap());
      SnackBarHelper.snackBarSuccess('Success', 'Card updated successfully');
      DailogHelper.hideDailoge();
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } on FirebaseException catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "Firestore error: ${e.message}");
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  static Future<void> removeFromSavedCard(CardModel card) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
            code: 'no-user', message: 'No user is logged in.');
      }
      final savedCardsRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .collection('SavedCards');

      await savedCardsRef.doc(card.cardID).delete();

      SnackBarHelper.snackBarSuccess('Success', 'Card removed successfully');
      DailogHelper.hideDailoge();
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } on FirebaseException catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "Firestore error: ${e.message}");
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  static Future<void> createAllCard({
    required BuildContext context,
    required CardModel cardModel,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection('Cards')
          .doc(cardModel.cardID)
          .set(cardModel.toMap());
      log('CardNew created successfully!');
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
    }
  }

  //Read Cards
  static Stream<List<CardModel>> readCards() async* {
    User? user = FirebaseAuth.instance.currentUser;
    String userId = user!.email!;
    try {
      yield* FirebaseFirestore.instance
          .collection('Users')
          .doc(userId)
          .collection('Cards')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => CardModel.fromMap(doc.data()))
              .toList());
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  static Stream<List<CardModel>> readSavedCards() async* {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      yield* FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.email)
          .collection('SavedCards')
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => CardModel.fromMap(doc.data()))
              .toList());
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  //Read All Cards
  static Stream<List<CardModel>> readAllCards() async* {
    try {
      yield* FirebaseFirestore.instance.collection('Cards').snapshots().map(
          (snapshot) => snapshot.docs
              .map((doc) => CardModel.fromMap(doc.data()))
              .toList());
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  //Delete ALL Cards
  static Future<void> deleteAllCard(CardModel card) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
            code: 'no-user', message: 'No user is logged in.');
      }

      final savedCardsRef = FirebaseFirestore.instance.collection('Cards');

      await savedCardsRef.doc(card.cardID).delete();

      log('Delete All Cards');
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } on FirebaseException catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "Firestore error: ${e.message}");
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  //Delete Cards
  static Future<void> deleteCard(BuildContext context, CardModel card) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw FirebaseAuthException(
            code: 'no-user', message: 'No user is logged in.');
      }

      final savedCardsRef = FirebaseFirestore.instance
          .collection('Users')
          .doc(user.email)
          .collection('Cards');

      await savedCardsRef.doc(card.cardID).delete();
      removeFromSavedCard(card);
      deleteAllCard(card);
      SnackBarHelper.snackBarSuccess('Success', 'Card removed successfully');
      DailogHelper.hideDailoge();
      ScreenRoutes.popNow(context);
    } on FirebaseAuthException catch (e) {
      DailogHelper.shoeErrorDailog(description: e.message);
      rethrow;
    } on FirebaseException catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "Firestore error: ${e.message}");
      rethrow;
    } catch (e) {
      DailogHelper.shoeErrorDailog(
          description: "An unknown error occurred: $e");
      rethrow;
    }
  }

  static Future<String> createShareableLink(String cardId) async {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix:
          'https://fluxmvp.page.link/eNh4', // Use your Firebase Dynamic Link URI
      link: Uri.parse(
          'https://yourapp.com/card?id=$cardId'), // Append cardId to the link
      androidParameters: AndroidParameters(
        packageName: 'com.example.flux_mvp', // Your app's Android package name
        minimumVersion: 1,
      ),
      iosParameters: IOSParameters(
        bundleId: 'com.example.flux_mvp', // Your app's iOS bundle ID
        minimumVersion: '1.0.0',
      ),
    );

    // Create the dynamic link
    Uri dynamicUrl = await FirebaseDynamicLinks.instance.buildLink(parameters);

    // Return the dynamic link as a string
    return dynamicUrl.toString();
  }

  static Future<void> shareCardLink(String cardId) async {
    String link = await createShareableLink(cardId);
    await Share.share('Check out this card: $link');
  }
}
