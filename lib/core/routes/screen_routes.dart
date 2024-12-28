import 'package:flutter/material.dart';
import 'package:flux_mvp/view/auth/login/screen_login.dart';
import 'package:flux_mvp/view/auth/signup/screen_signup.dart';
import 'package:flux_mvp/view/home/card_view/screen_card_view.dart';
import 'package:flux_mvp/view/home/cards/screen_cards.dart';
import 'package:flux_mvp/view/home/create_card/screen_create_card.dart';
import 'package:flux_mvp/view/home/home_screen/screen_home.dart';
import 'package:flux_mvp/view/home/my_cards/screen_my_cards.dart';
import 'package:flux_mvp/view/home/saved_cards/screen_saved_cards.dart';

class ScreenRoutes {
  static Future gotoScreens(context) async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ScreenSignup();
        },
      ),
    );
  }

  static gotoScreenLogin(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ScreenLogin();
        },
      ),
    );
  }

  static gotoScreenSignUp(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ScreenSignup();
        },
      ),
    );
  }

  static gotoScreenHome(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) {
          return ScreenHome();
        },
      ),
    );
  }

  static gotoScreenCards(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ScreenCards();
        },
      ),
    );
  }

  static gotoScreenCardsView(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ScreenCardView();
        },
      ),
    );
  }

  static gotoScreenSavedCards(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ScreenSavedCards();
        },
      ),
    );
  }

  static gotoScreenMyCards(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ScreenMyCards();
        },
      ),
    );
  }

  static gotoScreenCreateCard(context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return ScreenCreateCard();
        },
      ),
    );
  }

  static popNow(context) {
    Navigator.of(context).pop();
  }
}
