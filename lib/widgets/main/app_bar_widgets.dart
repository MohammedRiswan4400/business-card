import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
    required this.title,
    required this.width,
  });
  final String title;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ScreenRoutes.popNow(context),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: kInvertedTextColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Icon(Icons.arrow_back_ios_new_rounded, color: kTextColor),
              AppTextWidget(
                text: title,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
