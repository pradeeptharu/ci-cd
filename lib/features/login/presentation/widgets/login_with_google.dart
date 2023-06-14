import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';

class LoginWithGoogle extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? splashColor;

  const LoginWithGoogle({
    super.key,
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
    final orientations = MediaQuery.of(context).orientation;
    final isLandscape = orientations == Orientation.landscape;
    final isTabletDevice = isTablet(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrintation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrintation == Orientation.landscape;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          height: isLandscape
              ? isTabletDevice
                  ? MediaQuery.of(context).size.height * 0.1
                  : MediaQuery.of(context).size.height * 0.04
              : isTabletDevice
                  ? MediaQuery.of(context).size.height * 0.08
                  : MediaQuery.of(context).size.height * 0.085,
          width: isLandscape
              ? isTabletDevice
                  ? MediaQuery.of(context).size.width - 80
                  : MediaQuery.of(context).size.width - 45
              : isTabletDevice
                  ? MediaQuery.of(context).size.width - 45
                  : MediaQuery.of(context).size.width - 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
                        ? (orientations == Orientation.landscape
                            ? tabletLandscapeFontSize(context)
                            : tabletFontSize(context))
                        : defultFontSize(context),
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
