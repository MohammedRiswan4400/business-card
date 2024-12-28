import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class ScreenCreateCard extends StatefulWidget {
  const ScreenCreateCard({super.key});

  @override
  State<ScreenCreateCard> createState() => _ScreenCreateCardState();
}

class _ScreenCreateCardState extends State<ScreenCreateCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyDetailsController = TextEditingController();

  Color selectedColor = const Color.fromARGB(255, 48, 38, 10);
  bool isGradientSelected = false;
  Color startColor = Colors.blue;
  Color endColor = Colors.red;
  String? selectedColorRGB;

  String nameText = 'Name';
  String titleText = 'Title';
  String comapnyNameText = 'Company';
  String locationText = 'Location';
  String phoneText = 'Phone number';
  String emailText = 'E-mail';

  String getColorRgbValue(Color color) {
    return "100, ${color.red}, ${color.green}, ${color.blue}";
  }

  void pickColor(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Pick a Color'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: selectedColor,
            onColorChanged: (color) {
              setState(() {
                selectedColor = color;
                log(
                  "Selectod Color: ${getColorRgbValue(color)}",
                );
                selectedColorRGB = getColorRgbValue(color);
              });
            },
            // ignore: deprecated_member_use
            showLabel: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            child: const Text('Select'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void pickGradient(BuildContext context, bool isStartColor) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick a color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: isStartColor ? startColor : endColor,
              onColorChanged: (color) {
                setState(() {
                  if (isStartColor) {
                    startColor = color;
                  } else {
                    endColor = color;
                  }
                  log(
                    isStartColor
                        ? "Start Color: ${getColorRgbValue(color)}"
                        : "End Color: ${getColorRgbValue(color)}",
                  );
                });
              },
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Done'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarWidget(
              title: 'Create Card',
              width: 180,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                spacing: 10,
                children: [
                  isGradientSelected
                      ? Container(
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            gradient:
                                LinearGradient(colors: [startColor, endColor]),
                            border: Border.all(),
                          ),
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                        )
                      : Container(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
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
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Radio<bool>(
                            value: false,
                            groupValue: isGradientSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                isGradientSelected = value!;
                              });
                            },
                          ),
                          const Text('Color'),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<bool>(
                            value: true,
                            groupValue: isGradientSelected,
                            onChanged: (bool? value) {
                              setState(() {
                                isGradientSelected = value!;
                              });
                            },
                          ),
                          const Text('Gradient'),
                        ],
                      ),
                    ],
                  ),
                  isGradientSelected
                      ? Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => pickGradient(context, true),
                              child: const Text('First color'),
                            ),
                            ElevatedButton(
                              onPressed: () => pickGradient(context, false),
                              child: Column(
                                children: [
                                  const Text('Second color'),
                                ],
                              ),
                            ),
                          ],
                        )
                      : ElevatedButton(
                          onPressed: () => pickColor(context),
                          child: const Text('Select Gradient'),
                        ),
                  TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: "Enter your name",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        nameText = value;
                      });
                    },
                  ),
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: "Title",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        titleText = value;
                      });
                    },
                  ),
                  TextFormField(
                    controller: companyNameController,
                    decoration: const InputDecoration(
                      labelText: "Company name",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        comapnyNameText = value;
                      });
                    },
                  ),
                  TextFormField(
                    controller: locationController,
                    decoration: const InputDecoration(
                      labelText: "Location",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        locationText = value;
                      });
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: const InputDecoration(
                      labelText: "Phone",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        phoneText = value;
                      });
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      setState(() {
                        emailText = value;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () => log(selectedColorRGB!),
                    child: Container(
                      child: Text('Tap'),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
