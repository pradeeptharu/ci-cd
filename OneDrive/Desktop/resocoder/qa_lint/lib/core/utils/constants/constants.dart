import 'package:flutter/material.dart';

// normal fontsize
double defultFontSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.02;
}

// tablet fontsize
double tabletFontSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.023;
}

// icon moible size
double iconSizeMobile(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.023;
}

// icon tablet size
double iconSizeTablet(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.027;
}

// padding for tablet 30
double paddingTablet30(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.032;
}

// padding for mobile 10
double paddingMobile10(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.012;
}

// App Colors
class AppColor {
  static const backgroundColor = Color(0xFFD3E0EA);
  static const Color titleTextColor = Color(0xff000000);
  static const Color buttonColor = Color(0xff1687A7);
}

// hint teststyle
TextStyle hintStyle(
    {double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextOverflow? overflow}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: overflow,
  );
}

// lable style
TextStyle labelStyle(
    {double? fontSize,
    BuildContext? context,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextOverflow? overflow}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: overflow,
  );
}

// Media Querry height
double mediaQuerryHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// Medai Querry Width
double mediaQuerryWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//  Sized Box With height 10
Widget commonSizedBox(BuildContext context) {
  return SizedBox(
    height: mediaQuerryHeight(context) * 0.02,
  );
}

// Check isTablet Or Not
bool tabletIs(BuildContext context) {
  final shortesSide = MediaQuery.of(context).size.shortestSide;
  return shortesSide >= 600;
}

// Image Path
class ImagePath {
  static const qaLintLogo = 'assets/images/qa_lint_logo.png';
  static const googleLogo = 'assets/images/google.png';
}
