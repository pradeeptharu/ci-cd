import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/login/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _timer(context);
  }

  void _timer(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final deviceOrientation = MediaQuery.of(context).orientation;
            bool isLandscape = deviceOrientation == Orientation.landscape;
            return Column(
              children: [
                SizedBox(
                  height: mediaQuerryHeight(context) * 0.06,
                ),
                customText(
                  context: context,
                  text: 'Welcome To',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.3,
                  fontSize: mediaQuerryHeight(context) * 0.04,
                ),
                SizedBox(
                  height: isTablet()
                      ? mediaQuerryHeight(context) * 0.05
                      : mediaQuerryHeight(context) * 0.08,
                ),
                SizedBox(
                  height: isTablet()
                      ? isLandscape
                          ? mediaQuerryHeight(context) * 0.4
                          : mediaQuerryHeight(context) * 0.5
                      : mediaQuerryHeight(context) * 0.37,
                  width: isTablet()
                      ? isLandscape
                          ? mediaQuerryWidth(context) * 0.4
                          : mediaQuerryWidth(context) * 0.5
                      : mediaQuerryWidth(context),
                  child: Center(
                    child: Image.asset(
                      ImagePath.logoQaLint,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: mediaQuerryHeight(context) * 0.025,
                ),
                Column(
                  children: [
                    customText(
                      context: context,
                      text: 'YOUR PERSONALIZED PATHWAY',
                      fontWeight: FontWeight.w500,
                      fontSize: mediaQuerryHeight(context) * 0.025,
                    ),
                    customText(
                      context: context,
                      text: 'TO THRIVING IN QUALITY',
                      fontWeight: FontWeight.w500,
                      fontSize: mediaQuerryHeight(context) * 0.025,
                    ),
                    customText(
                      context: context,
                      text: 'ASSURANCE',
                      fontWeight: FontWeight.w500,
                      fontSize: mediaQuerryHeight(context) * 0.025,
                    ),
                  ],
                ),
                SizedBox(
                  height: isTablet()
                      ? isLandscape
                          ? mediaQuerryHeight(context) * 0.15
                          : mediaQuerryHeight(context) * 0.05
                      : mediaQuerryHeight(context) * 0.14,
                ),
                SpinKitSpinningLines(
                  color: Colors.black,
                  size: isLandscape
                      ? mediaQuerryHeight(context) * 0.1
                      : mediaQuerryHeight(context) * 0.08,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
