import 'package:flutter/material.dart';
import 'package:flux_mvp/core/constant/const.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    if (storage.read(isLogged) == null) {
      storage.write(isLogged, false);
    }

    ScreenRoutes.gotoScreens(context);
    return Scaffold(
      body: Center(
          child: Image.asset(
        'assets/splash_screen.png',
        height: MediaQuery.sizeOf(context).height,
        width: double.infinity,
        fit: BoxFit.cover,
      )),
    );
  }
}
