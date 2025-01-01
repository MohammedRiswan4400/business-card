import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:get/get.dart';

class DailogHelper {
  static void shoeErrorDailog({
    BuildContext? context,
    String title = "Error",
    String? description,
  }) {
    Get.dialog(
      Dialog(
        backgroundColor: kBlack,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 10,
            mainAxisSize: MainAxisSize.min,
            children: [
              AppTextWidget(
                text: title,
                // style: GoogleFonts.inder(
                //   color: kWhite,
                //   fontWeight: FontWeight.bold,
                // ),
              ),
              AppTextWidget(
                text: description ?? 'Somthing went wrong',
              ),
              GestureDetector(
                onTap: () {
                  hideDailoge();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    color: kBlack,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AppTextWidget(
                      text: "Ok",
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  static void showDailog([String? message]) {
    Get.dialog(
      Dialog(
        backgroundColor: kBlack,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(
                color: kWhite,
              ),
              AppTextWidget(
                text: message ?? "",
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void hideDailoge() {
    if (Get.isDialogOpen!) Get.back();
  }
}
