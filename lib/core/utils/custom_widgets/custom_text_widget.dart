// custom for text and textstyle
import 'package:flutter/material.dart';

_fontSizeForEveryDevice(BuildContext context) {
  final orientations = MediaQuery.of(context).orientation;
  final isLandscape = orientations == Orientation.landscape;
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }
}

Widget customText({
  String? text,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  Color? color,
  double? letterSpacing,
  TextOverflow? overflow,
  TextDecoration? decoration,
}) {
  return Text(
    text!,
    style: TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing,
      overflow: overflow,
      decoration: decoration,
      fontSize: fontSize,
    ),
  );
}
