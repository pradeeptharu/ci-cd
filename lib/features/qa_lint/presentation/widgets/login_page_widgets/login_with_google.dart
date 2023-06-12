import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';

class LoginWithGoogle extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? splashColor;

  const LoginWithGoogle({super.key, 
    required this.text,
    required this.onPressed,
    this.splashColor,
  });
  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: MediaQuery.of(context).size.height * 0.058,
      width: MediaQuery.of(context).size.width - 90,
      alignment: Alignment.center,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        splashColor: splashColor,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.buttonColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 8),
                child: Image.asset(
                  ImagePath.googleLogo,
                  height: mediaQuerryHeight(context) * 0.6,
                ),
              ),
              customText(
                text: text,
                fontSize: isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
