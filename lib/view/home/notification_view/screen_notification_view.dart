import 'package:flutter/material.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';

import '../../../widgets/main/main_widgets.dart';

class ScreenNotificationView extends StatelessWidget {
  const ScreenNotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            AppBarWidget(title: '', width: 60),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextWidget(
                      text: 'Title',
                      color: kInvertedTextColor,
                      size: 22,
                    ),
                    AppTextWidget(
                      text:
                          'Notification Content fmkdnfkdnfkd f fdnfndkf mdfjdkfnk dfdf nkdjnfd mjdnfjd fndfjd fndkfbjsdfnd fdf ndfdbfjds fsbfdns fnfdjfjdsf dhfjhufj dsfhduashfudfgdsufusd fh uds hfu dsi dfudfiud fu du fd f duf ud fu dsu fas j fdsakjfh oiasdy fuhsdi fdsf sdriswanbn fhsd rissewa     riswan  tm,m fdksfkldsafrrRiseanmr n fd fhdfhdid RisewNFDKS SRISD f Riswan MT .f..d...f..dfdnf fjd ffdfjkdsnjf ds fdnf dsnf ndsf dsnf jdsnf sdf ndsf d fddffjkds fn dsfnjlksd fnds fnns fn fnja nf jankfnasjmf md fmd fm',
                      // maxLine: 2,
                      color: kInvertedTextColor,
                      weight: FontWeight.w600,
                      size: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
