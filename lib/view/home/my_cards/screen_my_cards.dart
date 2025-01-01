import 'package:flutter/material.dart';
import 'package:flux_mvp/widgets/home/widgets_my_cards.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';

class ScreenMyCards extends StatelessWidget {
  const ScreenMyCards({super.key});

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
              AppBarWidget(title: 'My Cards', width: 135),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 10,
                    children: [
                      CreateCardButton(),
                      SizedBox(height: 10),
                      ListOfCardsWidgets(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
