import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:get/route_manager.dart';

class SnackBarHelper {
  static void snackBarSuccess(String? title, String? content) {
    Get.snackbar(
      title!,
      content!,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: kWhite,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      duration: const Duration(seconds: 3),
    );
  }

  static void snackBarFaild(
    String? title,
    String? content,
  ) {
    Get.snackbar(
      title!,
      content!,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black54,
      colorText: kWhite,
      borderRadius: 10,
      margin: const EdgeInsets.all(10),
      icon: const Icon(
        Icons.info,
        color: kWhite,
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
