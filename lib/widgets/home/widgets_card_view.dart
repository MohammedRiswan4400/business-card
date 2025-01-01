import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_cards.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/view/home/card_view/screen_card_view.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:share_plus/share_plus.dart';

class UserDetailsOnCardWidget extends StatelessWidget {
  const UserDetailsOnCardWidget({
    super.key,
    required this.widget,
  });

  final ScreenCardView widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 246, 197, 181),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextWidget(
              text: widget.cardModel.name,
              size: 17,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: widget.cardModel.title,
              size: 16,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: widget.cardModel.phoneNumber,
              size: 15,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: widget.cardModel.email,
              size: 15,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: 'Company Name : ${widget.cardModel.companyName}',
              size: 15,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: 'Company Details',
              size: 15,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: widget.cardModel.companyDetails,
              size: 14,
              weight: FontWeight.w500,
              color: kInvertedTextColor,
            ),
            AppTextWidget(
              text: 'Location : ${widget.cardModel.location}',
              size: 15,
              color: kInvertedTextColor,
            ),
          ],
        ),
      ),
    );
  }
}

class ShareCardButtonWidget extends StatelessWidget {
  const ShareCardButtonWidget({
    super.key,
    required this.widget,
  });

  final ScreenCardView widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final name = widget.cardModel.name;
        final title = widget.cardModel.title;
        final companyName = widget.cardModel.companyName;
        final location = widget.cardModel.location;
        final phone = widget.cardModel.phoneNumber;
        final email = widget.cardModel.email;
        final companyDetails = widget.cardModel.companyDetails;
        Share.share(
          'Name : $name\nTitle : $title\nCompany name : $companyName\nPhone : $phone\nE-mail : $email\nLocation : $location\nDetails:\n$companyDetails\n',
        );
      },
      child: Text(
        'Share',
      ),
    );
  }
}

class DeleteCardButtonWidget extends StatelessWidget {
  const DeleteCardButtonWidget({
    super.key,
    required this.widget,
  });

  final ScreenCardView widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        FunctionCards.deleteCard(context, widget.cardModel);
      },
      child: Text(
        'Delete',
      ),
    );
  }
}
