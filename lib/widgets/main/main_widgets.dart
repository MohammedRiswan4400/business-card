import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextWidget extends StatelessWidget {
  AppTextWidget(
      {super.key,
      required this.text,
      this.color,
      this.size,
      this.weight,
      this.maxLine,
      this.align});
  final String text;
  Color? color;
  double? size;
  FontWeight? weight;
  int? maxLine;
  TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align ?? TextAlign.center,
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLine ?? 100,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 30,
        fontWeight: weight ?? FontWeight.bold,
      ),
    );
  }
}
