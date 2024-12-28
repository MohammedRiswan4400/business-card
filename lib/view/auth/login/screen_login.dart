import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/widgets/main/form_fields.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class ScreenLogin extends StatelessWidget {
  ScreenLogin({super.key});
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
              Color.fromARGB(255, 11, 72, 96),
              const Color.fromARGB(255, 4, 45, 48),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              spacing: 20,
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MediaQuery.sizeOf(context).height < 800
                    ? SizedBox(height: MediaQuery.sizeOf(context).height / 15)
                    : SizedBox(height: MediaQuery.sizeOf(context).height / 6),
                AppTextWidget(text: 'Welcome Back!'),
                AppTextWidget(
                  maxLine: 2,
                  text:
                      'Continue where you left off and stay connected with your network.',
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
                          onTap: () => ScreenRoutes.gotoScreenHome(context),
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: kWhite),
                              borderRadius: BorderRadius.circular(50),
                              color: const Color.fromARGB(38, 3, 4, 25),
                            ),
                            child: Center(
                                child: AppTextWidget(text: 'Login', size: 20)),
                          ),
                        ),
                        // SizedBox(height: 5),
                        Center(child: AppTextWidget(text: 'Or', size: 20)),
                        Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(color: kBlack),
                              borderRadius: BorderRadius.circular(50),
                              color: kWhite),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.go)
                              AppTextWidget(
                                text: 'Continue with Google',
                                size: 15,
                                color: kBlack,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Icon(Icons.go)
                            AppTextWidget(
                              text: 'Don’t have an account? ',
                              size: 15,
                              weight: FontWeight.w500,
                              color: kTextColor,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  ScreenRoutes.gotoScreenSignUp(context),
                              child: AppTextWidget(
                                text: 'Sign Up',
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
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
