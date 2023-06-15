import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

Widget customText({
  String? text,
  double? fontSize,
  String? fontFamily,
  FontWeight? fontWeight,
  Color? color,
  double? letterSpacing,
  TextOverflow? overflow,
  TextDecoration? decoration,
  required context,
}) {
  Color defultColor = color ?? AppColor.buttonColor;
  double defaultFontsize = _isTablet(context)
      ? MediaQuery.of(context).orientation == Orientation.landscape
          ? tabletLandscapeFontSize(context)
          : tabletFontSize(context)
      : defultFontSize(context);
  return OrientationBuilder(
    builder: (context, orientation) {
      final deviceOrantation = MediaQuery.of(context).orientation;
      bool isLandscape = deviceOrantation == Orientation.landscape;
      return Text(
        text!,
        style: TextStyle(
          fontFamily: fontFamily,
          fontWeight: fontWeight,
          color: color ?? defultColor,
          letterSpacing: letterSpacing,
          overflow: overflow,
          decoration: decoration,
          fontSize: fontSize ?? defaultFontsize,
        ),
      );
    },
  );
}

bool _isTablet(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide >= 600;
}
