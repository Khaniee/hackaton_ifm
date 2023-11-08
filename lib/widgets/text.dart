import 'package:flutter/material.dart';
import 'package:hackaton_ifm/utils/color.dart';
import 'package:hackaton_ifm/utils/fontsize.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.data, {
    super.key,
    this.color = AppColor.textColor,
    this.fontSize = AppFontSize.medium,
    this.isBold = false,
    this.textAlign = TextAlign.left,
  });

  final String data;
  final Color color;
  final double fontSize;
  final bool isBold;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
    );
  }
}
