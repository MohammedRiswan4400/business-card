import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_colors.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class CardOnCardViewScreenWithColor extends StatelessWidget {
  const CardOnCardViewScreenWithColor({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: FunctionColors.convertStringToColor(
          card.color,
        ),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: card.name,
                  size: 10,
                ),
                AppTextWidget(
                  text: card.title,
                  size: 8,
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.business_center,
                      color: kWhite,
                      size: 10,
                    ),
                    AppTextWidget(
                      text: card.companyName,
                      size: 8,
                    ),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: kWhite,
                      size: 10,
                    ),
                    AppTextWidget(
                      text: card.location,
                      size: 8,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.phone,
                          color: kWhite,
                          size: 10,
                        ),
                        AppTextWidget(
                          text: card.phoneNumber,
                          size: 8,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.email,
                          color: kWhite,
                          size: 10,
                        ),
                        SizedBox(
                          width: 80,
                          child: AppTextWidget(
                            maxLine: 1,
                            text: card.email,
                            size: 8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CardOnCardViewScreenWithGradient extends StatelessWidget {
  const CardOnCardViewScreenWithGradient({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 20,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        gradient: LinearGradient(colors: [
          FunctionColors.convertStringToColor(card.gradientFirstColor),
          FunctionColors.convertStringToColor(card.gradientSecondColor),
        ]),
        border: Border.all(),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: card.name,
                  size: 10,
                ),
                AppTextWidget(
                  text: card.title,
                  size: 8,
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.business_center, color: kWhite, size: 10),
                    AppTextWidget(text: card.companyName, size: 8),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(Icons.location_on_rounded, color: kWhite, size: 10),
                    AppTextWidget(text: card.location, size: 8),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  spacing: 5,
                  children: [
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.phone, color: kWhite, size: 10),
                        AppTextWidget(text: card.phoneNumber, size: 8),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.email, color: kWhite, size: 10),
                        SizedBox(
                          width: 80,
                          child: AppTextWidget(
                              maxLine: 1, text: card.email, size: 8),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
