import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';

class CustomIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color splashColor;
  final Color iconColor;

  const CustomIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.splashColor = Colors.white10,
    this.iconColor = Colors.white,
  });

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;

    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrientation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrientation == Orientation.landscape;

        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: isLandscape
              ? mediaQuerryHeight(context) * 0.073
              : mediaQuerryHeight(context) * 0.058,
          width: isLandscape
              ? mediaQuerryWidth(context) - 90
              : mediaQuerryWidth(context) * 0.15,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: IconButton(
            icon: Center(
              child: Transform.scale(
                scale: 1.3,
                child: Icon(
                  icon,
                  size: isTablet(context)
                      ? isLandscape
                          ? mediaQuerryHeight(context) * 0.1
                          : mediaQuerryHeight(context) * 0.1
                      : mediaQuerryHeight(context) * 0.04,
                  color: iconColor,
                ),
              ),
            ),
            onPressed: onPressed,
          ),
        );
      },
    );
  }
}
