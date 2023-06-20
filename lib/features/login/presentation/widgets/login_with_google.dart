import 'package:qa_lint/core/utils/constants/exports.dart';

class LoginWithGoogle extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? splashColor;
  final String? image;

  const LoginWithGoogle({
    super.key,
    required this.text,
    required this.onPressed,
    required this.image,
    this.splashColor,
  });
  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final isTabletDevice = isTablet(context);
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrintation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrintation == Orientation.landscape;
        return Container(
          margin: EdgeInsets.symmetric(
            horizontal: mediaQuerryHeight(context) * 0.007,
          ),
          height: isLandscape
              ? isTabletDevice
                  ? mediaQuerryHeight(context) * 0.1
                  : mediaQuerryHeight(context) * 0.04
              : isTabletDevice
                  ? mediaQuerryHeight(context) * 0.08
                  : mediaQuerryHeight(context) * 0.086,
          width: isLandscape
              ? isTabletDevice
                  ? mediaQuerryWidth(context) - 80
                  : mediaQuerryWidth(context) - 45
              : isTabletDevice
                  ? mediaQuerryWidth(context) - 45
                  : mediaQuerryWidth(context) - 40,
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
                      image!,
                      height: mediaQuerryHeight(context) * 0.6,
                    ),
                  ),
                  customText(
                    context: context,
                    text: text,
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
