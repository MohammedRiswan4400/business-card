import 'package:flutter/material.dart';
import 'package:flux_mvp/widgets/home/widgets_cards.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';

class ScreenCards extends StatelessWidget {
  const ScreenCards({super.key});

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
              AppBarWidget(title: 'Cards', width: 115),
              Expanded(
                child: CardsWidgets(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
