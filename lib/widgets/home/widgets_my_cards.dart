import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_cards.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/card/screen_card_widgets.dart';
import 'package:flux_mvp/widgets/helper/dailoge_helper.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';
import 'package:miv_buttons/miv_buttons.dart';

class CreateCardButton extends StatelessWidget {
  const CreateCardButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Button(
        onClick: () {
          ScreenRoutes.gotoScreenCreateCard(context);
        },
        color: const Color.fromARGB(255, 48, 86, 116),
        borderRadius: 20.0,
        horizontalPadding: 16.0,
        verticalPadding: 12.0,
        elevation: 6.0,
        pressedElevation: 2.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 5,
          children: [
            AppTextWidget(
              text: 'Create Card',
              size: 16,
              color: kTextColor,
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: kTextColor,
              size: 20,
            )
          ],
        ),
      ),
      // labelColor: Colors.black,
    );
  }
}

class ListOfCardsWidgets extends StatelessWidget {
  const ListOfCardsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CardModel>>(
      stream: FunctionCards.readCards(),
      builder: (context, snapshot) {
        try {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading cards: ${snapshot.error}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: AppTextWidget(
              text: 'No cards found\n Create your on Cards',
              color: kInvertedTextColor,
              size: 18,
            ));
          } else {
            final cards = snapshot.data!;
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              separatorBuilder: (context, index) {
                return SizedBox(height: 10);
              },
              shrinkWrap: true,
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];

                return GestureDetector(
                  onTap: () =>
                      ScreenRoutes.gotoScreenCardsView(context, card, false),
                  child: card.isGradient
                      ? CardGradientWidget(card: card)
                      : CardColorWidget(card: card),
                );
              },
            );
          }
        } on FirebaseAuthException catch (e) {
          DailogHelper.shoeErrorDailog(description: e.message);
          return const Center(child: Text('Authentication Error.'));
        } catch (e) {
          DailogHelper.shoeErrorDailog(
              description: "An unknown error occurred: $e");
          return const Center(child: Text('Something went wrong.'));
        }
      },
    );
  }
}
