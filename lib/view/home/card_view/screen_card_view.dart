import 'package:flutter/material.dart';
import 'package:flux_mvp/controller/functions/function_cards.dart';
import 'package:flux_mvp/core/colors/const_colors.dart';
import 'package:flux_mvp/model/card_model.dart';
import 'package:flux_mvp/widgets/card/screen_card_widgets.dart';
import 'package:flux_mvp/widgets/home/widgets_card_view.dart';
import 'package:flux_mvp/widgets/main/app_bar_widgets.dart';

class ScreenCardView extends StatefulWidget {
  const ScreenCardView(
      {super.key, required this.cardModel, required this.isAllCArds});
  final CardModel cardModel;
  final bool isAllCArds;
  @override
  State<ScreenCardView> createState() => _ScreenCardViewState();
}

class _ScreenCardViewState extends State<ScreenCardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 20,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarWidget(title: 'Card view', width: 140),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    spacing: 20,
                    children: [
                      Stack(
                        children: [
                          widget.cardModel.isGradient
                              ? CardGradientWidget(card: widget.cardModel)
                              : CardColorWidget(card: widget.cardModel),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: GestureDetector(
                              onTap: () async {
                                setState(() {
                                  widget.cardModel.isSaved =
                                      !widget.cardModel.isSaved;
                                });
                                if (widget.cardModel.isSaved) {
                                  await FunctionCards.saveCard(
                                      widget.cardModel);
                                } else {
                                  await FunctionCards.removeFromSavedCard(
                                      widget.cardModel);
                                }
                              },
                              child: Icon(
                                widget.cardModel.isSaved
                                    ? Icons.bookmark
                                    : Icons.bookmark_border_rounded,
                                color: kWhite,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      UserDetailsOnCardWidget(widget: widget),
                      ShareCardButtonWidget(widget: widget),
                      widget.isAllCArds
                          ? SizedBox()
                          : DeleteCardButtonWidget(widget: widget),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
