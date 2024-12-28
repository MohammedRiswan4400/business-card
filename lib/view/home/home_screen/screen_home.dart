import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:flux_mvp/widgets/main/vibration.dart';
import 'package:miv_buttons/miv_buttons.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  final CardSwiperController controller = CardSwiperController();

  int selecTedIndex = 0;
  int selecTedIndexMobile = 0;
  List<CardModel> projects = [
    CardModel(
      title: 'CFA TVP',
      dencription:
          'I developed CFA TVP, a mobile application tailored for students of the Challengers Football Academy, using Flutter, Firebase, and the Provider package. The app enables students to easily track their personal progress with features like an improvement tracker, weekly performance charts, and highlights like the Performer of the Week. Additionally, users can stay updated with the latest academy news, including notable achievements, such as player selections for major events like the World Cup. This project emphasizes my ability to create focused, user-friendly apps with real-time updates and insights that bring value to sports enthusiasts and students alike.',
      url: 'https://github.com/MohammedRiswan4400/CFA-TVP',
      imageURL: 'assets/card7.png',
    ),
    CardModel(
      title: 'Focus Store',
      dencription:
          'I developed a mobile e-commerce app, Focus Store, using Flutter, Firebase, and Bloc for efficient state management. The app offers a wide range of products, including mobile phones, smartwatches, and headphones, with seamless integration of Razorpay for secure and convenient payment processing. This project allowed me to build an engaging user experience with a focus on responsive UI and streamlined shopping interactions.',
      url: 'https://github.com/MohammedRiswan4400/Focus-store',
      imageURL: 'assets/card2.png',
    ),
    CardModel(
      title: 'TMX Music',
      dencription:
          'I developed a mobile app called TMX Music using Flutter. It’s a dynamic, user-friendly music player designed to fetch songs directly from local storage, allowing users to enjoy their own music library. To ensure a responsive and consistent experience across screens, I used BLoC for state management, which streamlines state control and makes the app scalable for future features.\n\nThe app’s data is managed locally using the Hive database, enabling fast, offline access to music files. The design for TMX Music was crafted in Figma, ensuring a smooth, modern interface tailored to enhance the user experience. With intuitive navigation and efficient storage handling, TMX Music offers a clean, reliable music player experience.',
      url: 'https://github.com/MohammedRiswan4400/TMX-MUSIC',
      imageURL: 'assets/card3.png',
    ),
    CardModel(
      title: 'Instagram Clone',
      dencription:
          'I developed an Instagram clone with a responsive and dynamic interface, closely replicating the core layout and features of Instagram. Built with HTML, CSS, and JavaScript, the project dynamically loads content, creating a fluid, interactive experience similar to the real platform.\n\nUsing HTML for structure, CSS and media queries for responsive design, and JavaScript to add interactive, dynamic content, the clone offers a realistic simulation of Instagram’s feed, profile sections, and post interactions. The responsive design ensures a seamless experience across all devices, adapting smoothly to mobile, tablet, and desktop views.',
      url: 'https://github.com/MohammedRiswan4400/insta-clone',
      imageURL: 'assets/card4.png',
    ),
    CardModel(
      title: 'Netflix Clone',
      dencription:
          'I developed a Netflix clone, recreating the look and feel of the platform\'s user interface using HTML and CSS. This static website project showcases essential design elements like layout, typography, and responsive styling, all modeled to resemble the popular streaming service. Although it doesn\'t include dynamic content or video playback, this clone effectively captures the visual design of Netflix and demonstrates my skills in web design and front-end development.',
      url: 'https://github.com/MohammedRiswan4400/netflix-clone',
      imageURL: 'assets/card5.png',
    ),
    CardModel(
      title: 'Youtube Clone',
      dencription:
          'I developed a YouTube clone as a static website using HTML, CSS, and media queries to replicate the design and layout of the YouTube interface. The project is fully responsive, ensuring an optimal viewing experience across various screen sizes. \n\nWith HTML as the structure, CSS for styling, and media queries to handle responsiveness, the site mimics YouTube’s homepage layout, including video thumbnails, a navigation bar, and a sidebar for suggested content. Though it’s a static site without dynamic content, the layout and design offer an authentic look and feel, demonstrating strong foundational skills in web design and responsiveness.',
      url: 'https://github.com/MohammedRiswan4400/YouTube-clone',
      imageURL: 'assets/card6.png',
    ),
    CardModel(
      title: 'Youtube Clone',
      dencription:
          'I developed a YouTube clone as a static website using HTML, CSS, and media queries to replicate the design and layout of the YouTube interface. The project is fully responsive, ensuring an optimal viewing experience across various screen sizes. \n\nWith HTML as the structure, CSS for styling, and media queries to handle responsiveness, the site mimics YouTube’s homepage layout, including video thumbnails, a navigation bar, and a sidebar for suggested content. Though it’s a static site without dynamic content, the layout and design offer an authentic look and feel, demonstrating strong foundational skills in web design and responsiveness.',
      url: 'https://github.com/MohammedRiswan4400/YouTube-clone',
      imageURL: 'assets/card1.png',
    ),
    CardModel(
      title: 'Youtube Clone',
      dencription:
          'I developed a YouTube clone as a static website using HTML, CSS, and media queries to replicate the design and layout of the YouTube interface. The project is fully responsive, ensuring an optimal viewing experience across various screen sizes. \n\nWith HTML as the structure, CSS for styling, and media queries to handle responsiveness, the site mimics YouTube’s homepage layout, including video thumbnails, a navigation bar, and a sidebar for suggested content. Though it’s a static site without dynamic content, the layout and design offer an authentic look and feel, demonstrating strong foundational skills in web design and responsiveness.',
      url: 'https://github.com/MohammedRiswan4400/YouTube-clone',
      imageURL: 'assets/card8.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                  height: 400,
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
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 50, right: 20, left: 20),
                        child: Row(
                          // spacing: 20,
                          children: [
                            CircleAvatar(
                              radius: 30,
                            ),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: 'Mohammed Riswan',
                                  size: 18,
                                  weight: FontWeight.w800,
                                  color: kTextColor,
                                ),
                                AppTextWidget(
                                  text: 'Buisness Man',
                                  size: 15,
                                  weight: FontWeight.w600,
                                  color: kTextColor,
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kTextColor,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: CardSwiper(
                            // allowedSwipeDirection:
                            //     AllowedSwipeDirection.only(down: false),
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
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => ScreenRoutes.gotoScreenCards(context),
                    child: Container(
                      height: 40,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(40),
                        ),
                        color: kBlack,
                      ),
                      child: Center(
                        child: AppTextWidget(
                          text: 'See all',
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AppTextWidget(
                  text: 'Create yours',
                  size: 18,
                  // weight: FontWeight.bold,
                  color: kInvertedTextColor,
                ),
                SizedBox(height: 70),
                Center(
                  child: Stack(
                    children: [
                      Transform.rotate(
                        angle: 135 * pi / 180,
                        child: Container(
                          height: 130,
                          width: 240,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(46, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.amber,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/card2.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 90 * pi / 180,
                        child: Container(
                          height: 130,
                          width: 240,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(46, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.amber,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/card3.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 45 * pi / 180,
                        child: Container(
                          height: 130,
                          width: 240,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: const Color.fromARGB(46, 0, 0, 0)),
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.amber,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              'assets/card1.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 70),
                Container(
                  height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Button(
                    onClick: () {
                      triggerVibration();
                      ScreenRoutes.gotoScreenCreateCard(context);
                    },
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
                          text: 'Start',
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
                ),
                // SizedBox(height: 30),
                GridView(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    // mainAxisExtent: 150,
                  ),
                  children: [
                    GestureDetector(
                      onTap: () => ScreenRoutes.gotoScreenMyCards(context),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(46, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(240, 21, 132, 140),
                                const Color.fromARGB(251, 23, 64, 61),
                              ],
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppTextWidget(
                                text: 'My Cards',
                                size: 22,
                                color: kTextColor,
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: CircleAvatar(
                                  backgroundColor: kBlack,
                                  radius: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Icon(
                                      Icons.wallet,
                                      size: 60,
                                      color: kWhite,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => ScreenRoutes.gotoScreenSavedCards(context),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(46, 0, 0, 0)),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromRGBO(255, 24, 97, 0.746),
                              const Color.fromARGB(174, 64, 13, 112),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppTextWidget(
                                  text: 'Saved Cards',
                                  size: 22,
                                  color: kTextColor,
                                ),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: CircleAvatar(
                                    backgroundColor: kBlack,
                                    radius: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(
                                        Icons.bookmark,
                                        size: 60,
                                        color: kWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 38, 59, 79),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.notifications, color: kWhite),
                            AppTextWidget(
                              text: 'Notifications',
                              size: 12,
                              color: kTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 38, 59, 79),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.notifications, color: kWhite),
                            AppTextWidget(
                              text: 'Settings',
                              size: 12,
                              color: kTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color.fromARGB(255, 38, 59, 79),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.notifications, color: kWhite),
                            AppTextWidget(
                              text: 'Log out',
                              size: 12,
                              color: kTextColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Container(
                //   height: 200,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     border:
                //         Border.all(color: const Color.fromARGB(46, 0, 0, 0)),
                //     borderRadius: BorderRadius.circular(20),
                //     gradient: LinearGradient(colors: [
                //       const Color.fromARGB(99, 0, 0, 0),
                //       const Color.fromARGB(117, 139, 138, 138),
                //     ], begin: Alignment.topRight, end: Alignment.bottomLeft),
                //   ),
                // ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProjectImageOnMobile extends StatelessWidget {
  const ProjectImageOnMobile({
    super.key,
    required this.project,
  });
  final CardModel project;
  @override
  Widget build(
    BuildContext context,
  ) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          // color: const Color.fromARGB(255, 221, 3, 3),
        ),
        // alignment: Alignment.center,
        child: Image.asset(
          project.imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
