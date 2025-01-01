import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flux_mvp/controller/functions/function_colors.dart';
import 'package:flux_mvp/widgets/home/widget_create_card.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';

class ScreenCreateCard extends StatefulWidget {
  const ScreenCreateCard({super.key});

  @override
  State<ScreenCreateCard> createState() => _ScreenCreateflux_mvptate();
}

class _ScreenCreateflux_mvptate extends State<ScreenCreateCard> {
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController companyDetailsController = TextEditingController();
  final cardFormKey = GlobalKey<FormState>();
  Color selectedColor = const Color.fromARGB(255, 48, 38, 10);
  bool isGradientSelected = false;
  Color startColor = Colors.blue;
  Color endColor = Colors.red;
  String selectedColorRGB = '255, 62, 54, 33';
  String? selectedFirstGradientRGB = '255, 34, 151, 244';
  String? selectedSecondGradientRGB = '255, 244, 65, 52';

  String nameText = 'Name';
  String titleText = 'Title';
  String comapnyNameText = 'Company';
  String locationText = 'Location';
  String phoneText = 'Phone number';
  String emailText = 'E-mail';

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
                  "Selectod Color: ${FunctionColors.getColorRgbValue(color)}",
                );
                selectedColorRGB = FunctionColors.getColorRgbValue(color);
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
                        ? "Start Color: ${FunctionColors.getColorRgbValue(color)}"
                        : "End Color: ${FunctionColors.getColorRgbValue(color)}",
                  );
                  if (isStartColor == true) {
                    selectedFirstGradientRGB =
                        FunctionColors.getColorRgbValue(color);
                  } else {
                    selectedSecondGradientRGB =
                        FunctionColors.getColorRgbValue(color);
                  }
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
              child: Form(
                key: cardFormKey,
                child: Column(
                  spacing: 10,
                  children: [
                    isGradientSelected
                        ? SelectedGradientCardWidget(
                            startColor: startColor,
                            endColor: endColor,
                            nameText: nameText,
                            titleText: titleText,
                            comapnyNameText: comapnyNameText,
                            locationText: locationText,
                            phoneText: phoneText,
                            emailText: emailText)
                        : SelectedColorCardWidget(
                            selectedColor: selectedColor,
                            nameText: nameText,
                            titleText: titleText,
                            comapnyNameText: comapnyNameText,
                            locationText: locationText,
                            phoneText: phoneText,
                            emailText: emailText),
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
                            child: const Text('Select color'),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required*';
                        }
                        if (value.length < 2) {
                          return 'Please enter Name';
                        }
                        return null;
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Title is required*';
                        }
                        if (value.length < 2) {
                          return 'Please enter Title';
                        }
                        return null;
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Company namr is required*';
                        }
                        if (value.length < 2) {
                          return 'Please enter Comapany name';
                        }
                        return null;
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Location is required*';
                        }
                        if (value.length < 2) {
                          return 'Please enter Location';
                        }
                        return null;
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required*';
                        }
                        if (value.length < 10) {
                          return 'Please enter a valid phone number';
                        }
                        return null;
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required*';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      maxLines: 4,
                      controller: companyDetailsController,
                      decoration: const InputDecoration(
                        labelText: "Company Details",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20),
                    ContinueWidget(
                        cardFormKey: cardFormKey,
                        nameController: nameController,
                        titleController: titleController,
                        companyNameController: companyNameController,
                        locationController: locationController,
                        phoneNumberController: phoneNumberController,
                        emailController: emailController,
                        companyDetailsController: companyDetailsController,
                        isGradientSelected: isGradientSelected,
                        selectedColorRGB: selectedColorRGB,
                        selectedFirstGradientRGB: selectedFirstGradientRGB,
                        selectedSecondGradientRGB: selectedSecondGradientRGB),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ));
  }
}
