import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_cards.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/constant/const.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:flux_mvp/widgets/main/snack_bar.dart';

class SelectedGradientCardWidget extends StatelessWidget {
  const SelectedGradientCardWidget({
    super.key,
    required this.startColor,
    required this.endColor,
    required this.nameText,
    required this.titleText,
    required this.comapnyNameText,
    required this.locationText,
    required this.phoneText,
    required this.emailText,
  });

  final Color startColor;
  final Color endColor;
  final String nameText;
  final String titleText;
  final String comapnyNameText;
  final String locationText;
  final String phoneText;
  final String emailText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        gradient: LinearGradient(colors: [startColor, endColor]),
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
                  text: nameText,
                  size: 18,
                ),
                AppTextWidget(
                  text: titleText,
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
                      text: comapnyNameText,
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
                      text: locationText,
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
                          text: phoneText,
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
                          text: emailText,
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

class SelectedColorCardWidget extends StatelessWidget {
  const SelectedColorCardWidget({
    super.key,
    required this.selectedColor,
    required this.nameText,
    required this.titleText,
    required this.comapnyNameText,
    required this.locationText,
    required this.phoneText,
    required this.emailText,
  });

  final Color selectedColor;
  final String nameText;
  final String titleText;
  final String comapnyNameText;
  final String locationText;
  final String phoneText;
  final String emailText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20,
        ),
        color: selectedColor,
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
                  text: nameText,
                  size: 18,
                ),
                AppTextWidget(
                  text: titleText,
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
                      text: comapnyNameText,
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
                      text: locationText,
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
                          text: phoneText,
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
                          text: emailText,
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

class ContinueWidget extends StatelessWidget {
  const ContinueWidget({
    super.key,
    required this.cardFormKey,
    required this.nameController,
    required this.titleController,
    required this.companyNameController,
    required this.locationController,
    required this.phoneNumberController,
    required this.emailController,
    required this.companyDetailsController,
    required this.isGradientSelected,
    required this.selectedColorRGB,
    required this.selectedFirstGradientRGB,
    required this.selectedSecondGradientRGB,
  });

  final GlobalKey<FormState> cardFormKey;
  final TextEditingController nameController;
  final TextEditingController titleController;
  final TextEditingController companyNameController;
  final TextEditingController locationController;
  final TextEditingController phoneNumberController;
  final TextEditingController emailController;
  final TextEditingController companyDetailsController;
  final bool isGradientSelected;
  final String selectedColorRGB;
  final String? selectedFirstGradientRGB;
  final String? selectedSecondGradientRGB;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (cardFormKey.currentState?.validate() ?? false) {
          FunctionCards.createCards(
            context: context,
            cardModel: CardModel(
              cardID: uuid.v4(),
              isSaved: false,
              name: nameController.text.trim(),
              title: titleController.text.trim(),
              companyName: companyNameController.text.trim(),
              location: locationController.text.trim(),
              phoneNumber: phoneNumberController.text.trim(),
              email: emailController.text.trim(),
              companyDetails: companyDetailsController.text.trim(),
              isGradient: isGradientSelected,
              color: selectedColorRGB,
              gradientFirstColor: selectedFirstGradientRGB!,
              gradientSecondColor: selectedSecondGradientRGB!,
            ),
          );
          log(selectedColorRGB);
        } else {
          SnackBarHelper.snackBarFaild(
            'Oops!',
            'both fields are required.',
          );
        }
      },
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: kBlack),
            borderRadius: BorderRadius.circular(50),
            color: kWhite),
        child: Center(
          child: AppTextWidget(
            text: 'Continue',
            size: 15,
            color: kBlack,
          ),
        ),
      ),
    );
  }
}
