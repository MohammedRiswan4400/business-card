import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:miv_buttons/miv_buttons.dart';

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
                      Container(
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 52, 94, 106),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(),
                                  SizedBox(width: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppTextWidget(
                                        maxLine: 1,
                                        text: 'Mohammed Riswan',
                                        size: 12,
                                      ),
                                      AppTextWidget(
                                        maxLine: 1,
                                        text: 'Buisness man',
                                        size: 10,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: kWhite,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Button(
                          // borderRadius: 20,
                          onClick: () {},
                          color: const Color.fromARGB(255, 48, 86, 116),
                          borderRadius: 20.0,
                          horizontalPadding: 16.0,
                          verticalPadding: 12.0,
                          elevation: 6.0,
                          pressedElevation: 2.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 5,
                            children: [
                              AppTextWidget(
                                text: 'Create Card',
                                size: 16,
                                color: kTextColor,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: kTextColor,
                                size: 20,
                              )
                            ],
                          ),
                        ),
                        // labelColor: Colors.black,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/card5.png',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/card8.png',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/card3.png',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/card1.png',
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
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
