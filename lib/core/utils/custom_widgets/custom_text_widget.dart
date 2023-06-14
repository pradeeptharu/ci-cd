import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

// Widget customText({
//   String? text,
//   double? fontSize,
//   String? fontFamily,
//   FontWeight? fontWeight,
//   Color? color,
//   double? letterSpacing,
//   TextOverflow? overflow,
//   TextDecoration? decoration,
// }) {
//   Color defultColor = color ?? AppColor.buttonColor;
//   return Text(
//     text!,
//     style: TextStyle(
//       fontFamily: fontFamily,
//       fontWeight: fontWeight,
//       color: color ?? defultColor,
//       letterSpacing: letterSpacing,
//       overflow: overflow,
//       decoration: decoration,
//       fontSize: fontSize,
//     ),
//   );
// }
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
          fontSize: _isTablet(context)
              ? isLandscape
                  ? tabletLandscapeFontSize(context)
                  : tabletFontSize(context)
              : defultFontSize(context),
        ),
      );
    },
  );
}

bool _isTablet(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide >= 600;
}
