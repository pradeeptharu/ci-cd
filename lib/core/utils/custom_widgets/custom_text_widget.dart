// custom for text and textstyle
import 'package:flutter/material.dart';

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