import 'package:flutter/material.dart';

import 'package:flux_mvp/widgets/home/widgets_saved_cards.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';

class ScreenSavedCards extends StatelessWidget {
  const ScreenSavedCards({super.key});

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
              AppBarWidget(title: 'Saved Cards', width: 160),
              Expanded(
                child: ListOfSavedCardWidgets(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
