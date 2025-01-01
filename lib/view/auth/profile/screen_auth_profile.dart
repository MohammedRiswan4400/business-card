import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_profile.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/model/user_model.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:flux_mvp/widgets/main/snack_bar.dart';

// ignore: must_be_immutable
class ScreenAuthProfile extends StatelessWidget {
  ScreenAuthProfile({super.key, required this.email});
  final profieleFormKey = GlobalKey<FormState>();
  final String email;
  TextEditingController nameController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: profieleFormKey,
          child: Column(
            spacing: 20,
            children: [
              SizedBox(height: 20),
              AppTextWidget(
                text: 'Create your profile',
                size: 20,
                color: kInvertedTextColor,
                // size: 22,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required*';
                  }
                  if (value.length < 3) {
                    return 'Please enter a valid Name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Title (Buisness Man, Doctor, Engineer...)",
                  border: OutlineInputBorder(),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Title is required*';
                  }
                  if (value.length < 3) {
                    return 'Please enter a valid Title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (profieleFormKey.currentState?.validate() ?? false) {
                    FunctionProfile.createProfile(
                      context: context,
                      userModel: UserModel(
                          name: nameController.text.trim(),
                          title: titleController.text.trim(),
                          email: ''),
                    );
                  } else {
                    SnackBarHelper.snackBarFaild(
                      'Oops!',
                      'Both name and title are required.',
                    );
                  }
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/profile_card.png',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
