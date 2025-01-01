import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_auth.dart';
import 'package:flux_mvp/controller/functions/function_profile.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/model/user_model.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miv_buttons/miv_buttons.dart';

class SeeAllCardWidgets extends StatelessWidget {
  const SeeAllCardWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}

class ProfileStreamBuilder extends StatelessWidget {
  const ProfileStreamBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserModel?>(
      stream: FunctionProfile.readProfile(), // Listen to the profile stream
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show a loading indicator while the data is being fetched
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          // Handle errors
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data == null) {
          // If no data is returned (profile not found)
          return const Center(
            child: Text('Profile not found.'),
          );
        } else {
          final profileData = snapshot.data!;
          String name = profileData.name;
          String title = profileData.title;

          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
            child: GestureDetector(
              onTap: () => ScreenRoutes.gotoScreenProfile(context, profileData),
              child: Row(
                // spacing: 20,
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          fit: BoxFit.cover,
                          height: 50,
                          'assets/profile_image.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextWidget(
                        text: name,
                        size: 18,
                        weight: FontWeight.w800,
                        color: kTextColor,
                      ),
                      AppTextWidget(
                        text: title,
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
          );
        }
      },
    );
  }
}

class CreateYourCardsBoxWidgets extends StatelessWidget {
  const CreateYourCardsBoxWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Create yours',
          style: GoogleFonts.sacramento(
              fontSize: 30,
              color: kInvertedTextColor,
              fontWeight: FontWeight.w900),
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
                    border:
                        Border.all(color: const Color.fromARGB(46, 0, 0, 0)),
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
                    border:
                        Border.all(color: const Color.fromARGB(46, 0, 0, 0)),
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
                    border:
                        Border.all(color: const Color.fromARGB(46, 0, 0, 0)),
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
              // triggerVibration();
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
      ],
    );
  }
}

class SavedCardsAndMyCardsGridviewWidget extends StatelessWidget {
  const SavedCardsAndMyCardsGridviewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView(
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
              border: Border.all(color: const Color.fromARGB(46, 0, 0, 0)),
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [
                const Color.fromARGB(240, 21, 132, 140),
                const Color.fromARGB(251, 23, 64, 61),
              ], begin: Alignment.topRight, end: Alignment.bottomLeft),
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
              border: Border.all(color: const Color.fromARGB(46, 0, 0, 0)),
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
    );
  }
}

class HomeScreenLastWidgets extends StatelessWidget {
  const HomeScreenLastWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () => ScreenRoutes.gotoScreenNotification(context),
          child: Container(
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
        ),
        GestureDetector(
          onTap: () {
            AuthFunctions.signOut(context);
          },
          child: Container(
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
                  Icon(Icons.logout, color: kWhite),
                  AppTextWidget(
                    text: 'Log out',
                    size: 12,
                    color: kTextColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProjectImageOnMobile extends StatelessWidget {
  const ProjectImageOnMobile({
    super.key,
    required this.project,
  });
  final CardModel2 project;
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
