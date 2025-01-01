import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flux_mvp/controller/fcm/fcm.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/home/widgets_home_screen.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final CardSwiperController controller = CardSwiperController();

  int selecTedIndex = 0;
  int selecTedIndexMobile = 0;
  List<CardModel2> projects = [
    CardModel2(
      imageURL: 'assets/card7.png',
    ),
    CardModel2(
      imageURL: 'assets/card2.png',
    ),
    CardModel2(
      imageURL: 'assets/card3.png',
    ),
    CardModel2(
      imageURL: 'assets/card4.png',
    ),
    CardModel2(
      imageURL: 'assets/card5.png',
    ),
    CardModel2(
      imageURL: 'assets/card6.png',
    ),
    CardModel2(
      imageURL: 'assets/card1.png',
    ),
    CardModel2(
      imageURL: 'assets/card8.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Fcm.createFCMTOKEN();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: kWhite,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // spacing: 10,
                children: [
                  SizedBox(height: 10),
                  Container(
                      width: double.infinity,
                      height: 380,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                        color: kBlack,
                      ),
                      child: Column(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProfileStreamBuilder(),
                          SizedBox(
                            height: 220,
                            child: CardSwiper(
                                controller: controller,
                                cardsCount: projects.length,
                                onSwipe: (index, previousIndex, direction) {
                                  setState(() {
                                    index == projects.length - 1
                                        ? selecTedIndexMobile = 0
                                        : selecTedIndexMobile = index + 1;
                                  });
                                  return true;
                                },
                                numberOfCardsDisplayed: projects.length,
                                backCardOffset: const Offset(0, -20),
                                padding: const EdgeInsets.all(20.0),
                                cardBuilder: (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) {
                                  return ProjectImageOnMobile(
                                      project: projects[index]);
                                }),
                          ),
                        ],
                      )),
                  SeeAllCardWidgets(),
                  SizedBox(height: 20),
                  CreateYourCardsBoxWidgets(),
                  SizedBox(height: 20),
                  SavedCardsAndMyCardsGridviewWidget(),
                  SizedBox(height: 20),
                  HomeScreenLastWidgets(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
