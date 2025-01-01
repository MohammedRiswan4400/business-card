import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_auth.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/widgets/main/form_fields.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:flux_mvp/widgets/main/snack_bar.dart';

class ScreenSignup extends StatelessWidget {
  ScreenSignup({super.key});
  final signUpFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 5, 59, 153),
              const Color.fromARGB(255, 5, 19, 39),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: signUpFormKey,
              child: Column(
                  spacing: 20,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MediaQuery.sizeOf(context).height < 800
                        ? SizedBox(
                            height: MediaQuery.sizeOf(context).height / 15)
                        : SizedBox(
                            height: MediaQuery.sizeOf(context).height / 6),
                    AppTextWidget(text: 'Join Us!'),
                    AppTextWidget(
                      align: TextAlign.left,
                      text: 'Your digital business card journey begins here.',
                      maxLine: 2,
                      size: 20,
                      weight: FontWeight.normal,
                    ),

                    SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(20, 255, 255, 255),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          spacing: 20,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextWidget(text: 'Email', size: 20),
                            EmailTextFormField(
                              action: TextInputAction.next,
                              controller: emailController,
                            ),
                            PasswordField(
                                action: TextInputAction.done,
                                passwoedController: passwordController,
                                hintText: 'Enter confirm password'),
                            // SizedBox(height: 1),
                            GestureDetector(
                              onTap: () {
                                if (signUpFormKey.currentState?.validate() ??
                                    false) {
                                  AuthFunctions.createUserWithEmailAndPassword(
                                    ctx: context,
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  );
                                } else {
                                  SnackBarHelper.snackBarFaild(
                                    'Oops!',
                                    'both email and password are required.',
                                  );
                                }
                              },
                              child: Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border: Border.all(color: kWhite),
                                  borderRadius: BorderRadius.circular(50),
                                  color: const Color.fromARGB(38, 3, 4, 25),
                                ),
                                child: Center(
                                    child: AppTextWidget(
                                        text: 'Sign Up', size: 20)),
                              ),
                            ),
                            // SizedBox(height: 5),
                            Center(child: AppTextWidget(text: 'Or', size: 20)),

                            Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(Icons.go)
                                AppTextWidget(
                                  text: 'Already have an account',
                                  size: 15,
                                  weight: FontWeight.w500,
                                  color: kTextColor,
                                ),
                                GestureDetector(
                                  onTap: () =>
                                      ScreenRoutes.gotoScreenLogin(context),
                                  child: AppTextWidget(
                                    text: 'Login',
                                    size: 20,
                                    weight: FontWeight.w900,
                                    color: kTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ),
                    SizedBox(height: 10)
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
