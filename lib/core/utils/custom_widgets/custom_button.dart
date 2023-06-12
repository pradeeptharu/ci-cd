import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color splashColor;

  const CustomButton({
    required this.text,
    required this.onPressed,
    this.splashColor = Colors.white10,
  });

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(24),
        splashColor: splashColor,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColor.buttonColor,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 12),
            height: MediaQuery.of(context).size.height * 0.058,
            width: MediaQuery.of(context).size.width - 45,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            child: customText(
                text: text,
                fontSize: isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.1),
          ),
        ),
      ),
    );
  }
}
