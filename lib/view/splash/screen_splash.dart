import 'package:flutter/material.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenRoutes.gotoScreens(context);
    return Scaffold(
      body: Center(child: Text('Splash Screen')),
    );
  }
}
