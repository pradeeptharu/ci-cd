import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/login_page/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _timer(context);
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.repeat(reverse: true);
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
    controller.dispose();
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
        child: Column(
          children: [
            SizedBox(
              height: mediaQuerryHeight(context) * 0.1,
            ),
            customText(
              text: 'Welcome To',
              fontWeight: FontWeight.bold,
              letterSpacing: 1.3,
              color: AppColor.buttonColor,
              fontSize: mediaQuerryHeight(context) * 0.04,
            ),
            SizedBox(
              height: isTablet()
                  ? mediaQuerryHeight(context) * 0.05
                  : mediaQuerryHeight(context) * 0.08,
            ),
            SizedBox(
              height: isTablet()
                  ? mediaQuerryHeight(context) * 0.5
                  : mediaQuerryHeight(context) * 0.31,
              width: double.infinity,
              child: ScaleTransition(
                scale: animation,
                child: Image.asset(
                  ImagePath.qaLintLogo,
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
                  text: 'YOUR PERSONALIZED PATHWAY',
                  fontWeight: FontWeight.w500,
                  fontSize: mediaQuerryHeight(context) * 0.025,
                ),
                commonSizedBox(context),
                customText(
                  text: 'TO THRIVING IN QUALITY',
                  fontWeight: FontWeight.w500,
                  fontSize: mediaQuerryHeight(context) * 0.025,
                ),
                commonSizedBox(context),
                customText(
                  text: 'ASSURANCE',
                  fontWeight: FontWeight.w500,
                  fontSize: mediaQuerryHeight(context) * 0.025,
                ),
              ],
            ),
            SizedBox(
              height: isTablet()
                  ? mediaQuerryHeight(context) * 0.05
                  : mediaQuerryHeight(context) * 0.07,
            ),
            SpinKitSpinningLines(
              color: Colors.black,
              size: mediaQuerryHeight(context) * 0.08,
            ),
          ],
        ),
      ),
    );
  }
}
