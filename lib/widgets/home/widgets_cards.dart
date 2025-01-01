import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_cards.dart';
import 'package:flux_mvp/core/routes/screen_routes.dart';
import 'package:flux_mvp/widgets/card/screen_card_view_widgets.dart';
import 'package:flux_mvp/widgets/helper/dailoge_helper.dart';
import 'package:flux_mvp/widgets/main/main_widgets.dart';

class CardsWidgets extends StatelessWidget {
  const CardsWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FunctionCards.readAllCards(),
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
            return const Center(child: Text('No cards found.'));
          } else {
            final cards = snapshot.data!;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                return GestureDetector(
                  onTap: () =>
                      ScreenRoutes.gotoScreenCardsView(context, card, true),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 52, 94, 106),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              width: 160,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: card.isGradient
                                    ? CardOnCardViewScreenWithGradient(
                                        card: card)
                                    : CardOnCardViewScreenWithColor(card: card),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CircleAvatar(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image.asset(
                                    fit: BoxFit.cover,
                                    height: 30,
                                    'assets/profile_image.png',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width / 3.35,
                                // color: Colors.amberAccent,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppTextWidget(
                                      maxLine: 1,
                                      text: card.name,
                                      size: 12,
                                    ),
                                    AppTextWidget(
                                      maxLine: 1,
                                      text: card.title,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
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
