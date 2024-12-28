import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

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
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => ScreenRoutes.gotoScreenCardsView(context),
                      child: Container(
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
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                ),
                              ),
                              // s
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(),
                                  SizedBox(
                                    width:
                                        MediaQuery.sizeOf(context).width / 3.35,
                                    // color: Colors.amberAccent,
                                    child: Column(
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
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
