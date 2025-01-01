import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_colors.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class CardColorWidget extends StatelessWidget {
  const CardColorWidget({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: FunctionColors.convertStringToColor(
          card.color,
        ),
        //  gradient:
        //     LinearGradient(colors: [card.gradientFirstColor, endColor]),
        border: Border.all(),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: card.name,
                  size: 18,
                ),
                AppTextWidget(
                  text: card.title,
                  size: 12,
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.business_center,
                      color: kWhite,
                    ),
                    AppTextWidget(
                      text: card.companyName,
                      size: 18,
                    ),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: kWhite,
                    ),
                    AppTextWidget(
                      text: card.location,
                      size: 18,
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
                          size: 15,
                        ),
                        AppTextWidget(
                          text: card.phoneNumber,
                          size: 12,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.email,
                          color: kWhite,
                          size: 15,
                        ),
                        AppTextWidget(
                          text: card.email,
                          size: 12,
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
      // child: Image.asset(
      //   'assets/card5.png',
      //   height: 200,
      //   width: double.infinity,
      //   fit: BoxFit.cover,
      // ),
    );
  }
}

class CardGradientWidget extends StatelessWidget {
  const CardGradientWidget({
    super.key,
    required this.card,
  });

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        // color: FunctionColors.convertStringToColor(
        //   card.color,
        // ),
        gradient: LinearGradient(colors: [
          FunctionColors.convertStringToColor(card.gradientFirstColor),
          FunctionColors.convertStringToColor(card.gradientSecondColor),
        ]),
        border: Border.all(),
      ),
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: card.name,
                  size: 18,
                ),
                AppTextWidget(
                  text: card.title,
                  size: 12,
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.business_center,
                      color: kWhite,
                    ),
                    AppTextWidget(
                      text: card.companyName,
                      size: 18,
                    ),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Icon(
                      Icons.location_on_rounded,
                      color: kWhite,
                    ),
                    AppTextWidget(
                      text: card.location,
                      size: 18,
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
                          size: 15,
                        ),
                        AppTextWidget(
                          text: card.phoneNumber,
                          size: 12,
                        ),
                      ],
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.email,
                          color: kWhite,
                          size: 15,
                        ),
                        AppTextWidget(
                          text: card.email,
                          size: 12,
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
