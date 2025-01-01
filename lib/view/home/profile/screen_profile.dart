import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/model/user_model.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(title: 'Profile', width: 130),
            Expanded(
              child: Column(
                spacing: 5,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextWidget(
                    text: 'Name: ${user.name}',
                    color: kInvertedTextColor,
                    // size: 22,
                  ),
                  AppTextWidget(
                    text: 'Title: ${user.title}',
                    color: kInvertedTextColor,
                    size: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
