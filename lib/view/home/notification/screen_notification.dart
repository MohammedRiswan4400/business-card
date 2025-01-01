import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/widgets/home/widgets_notifications.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class ScreenNotification extends StatelessWidget {
  const ScreenNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 10,
            children: [
              AppBarWidget(title: 'Notificarion', width: 160),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget(text: 'Today', color: kInvertedTextColor),
                    NewNotificationWidget(),
                    Divider(),
                    ReadedNotificationTile(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
