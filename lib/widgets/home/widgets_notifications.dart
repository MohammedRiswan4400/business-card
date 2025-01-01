import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';

import '../main/main_widgets.dart';

class NewNotificationWidget extends StatelessWidget {
  const NewNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ScreenRoutes.gotoScreenViewNotification(context),
      child: Badge(
        smallSize: 12,
        backgroundColor: const Color.fromARGB(255, 72, 114, 117),
        child: SizedBox(
          // color: Colors.amber,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextWidget(
                  text: 'Title',
                  color: kInvertedTextColor,
                  size: 18,
                ),
                AppTextWidget(
                  text:
                      'Notification Content fmkdnfkdnfkd f fdnfndkf mdfjdkfnk dfdf nkdjnfdnf fjd ffdfjkdsnjf ds fdnf dsnf ndsf dsnf jdsnf sdf ndsf d fddffjkds fn dsfnjlksd fnds fnns fn fnja nf jankfnasjmf md fmd fm',
                  maxLine: 2,
                  color: kInvertedTextColor,
                  weight: FontWeight.w600,
                  size: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReadedNotificationTile extends StatelessWidget {
  const ReadedNotificationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.amber,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: 'Title',
              color: kDarkGrey,
              size: 18,
            ),
            AppTextWidget(
              text:
                  'Notification Content fmkdnfkdnfkd f fdnfndkf mdfjdkfnk dfdf nkdjnfdnf fjd ffdfjkdsnjf ds fdnf dsnf ndsf dsnf jdsnf sdf ndsf d fddffjkds fn dsfnjlksd fnds fnns fn fnja nf jankfnasjmf md fmd fm',
              maxLine: 2,
              color: kDarkGrey,
              weight: FontWeight.w600,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
