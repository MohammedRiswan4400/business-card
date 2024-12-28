import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class ScreenCardView extends StatelessWidget {
  const ScreenCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(title: 'Card view', width: 140),
            Expanded(
                child: Column(
              spacing: 20,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        'assets/card5.png',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      // left: 0,
                      child: Icon(
                        Icons.bookmark_border_rounded,
                        color: kWhite,
                        size: 40,
                      ),
                    )
                  ],
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 246, 197, 181)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      spacing: 5,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent),
                        ),
                        AppTextWidget(
                          text: 'Mohammed Riswan',
                          size: 17,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text: 'Buisness Man',
                          size: 16,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text: '+91 8138874400',
                          size: 15,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text: 'riswanmt4400@gmail.com',
                          size: 15,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text: 'Company Name : Dressco.',
                          size: 15,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text: 'Company Details',
                          size: 15,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text:
                              'Dressco. is a clothing brand mfmk fkd n jfnjdf d fjdf d  fmdnfd fdkfndf dfdkfn dfndnkf d fndnfdfn dnfd',
                          size: 14,
                          weight: FontWeight.w500,
                          color: kInvertedTextColor,
                        ),
                        AppTextWidget(
                          text: 'Location : VLY',
                          size: 15,
                          color: kInvertedTextColor,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      )),
    );
  }
}
