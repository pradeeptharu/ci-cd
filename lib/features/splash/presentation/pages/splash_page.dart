import 'package:qa_lint/core/utils/constants/exports.dart';
import 'package:qa_lint/features/splash/presentation/widgets/splash_custom_widget.dart';

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
      Navigator.pushReplacementNamed(context, '/loginPage');
    });
  }

  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  SplashWidget splashWidget = SplashWidget();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            final deviceOrientation = MediaQuery.of(context).orientation;
            bool isLandscape = deviceOrientation == Orientation.landscape;

            final double headerFontSize = isTablet()
                ? mediaQuerryHeight(context) * 0.05
                : mediaQuerryHeight(context) * 0.05;

            final double contentFontSize = isTablet()
                ? isLandscape
                    ? mediaQuerryHeight(context) * 0.035
                    : mediaQuerryHeight(context) * 0.028
                : mediaQuerryHeight(context) * 0.03;

            final double logoHeight = isTablet()
                ? isLandscape
                    ? mediaQuerryHeight(context) * 0.4
                    : mediaQuerryHeight(context) * 0.5
                : mediaQuerryHeight(context) * 0.37;

            final double logoWidth = isTablet()
                ? isLandscape
                    ? mediaQuerryWidth(context) * 0.4
                    : mediaQuerryWidth(context) * 0.5
                : mediaQuerryWidth(context);

            return Column(
              children: [
                SizedBox(
                  height: mediaQuerryHeight(context) * 0.06,
                ),
                splashWidget.buildContentText(
                    context, 'Welcome To', headerFontSize),
                SizedBox(
                  height: isTablet()
                      ? mediaQuerryHeight(context) * 0.05
                      : mediaQuerryHeight(context) * 0.08,
                ),
                splashWidget.buildLogoImage(context, logoHeight, logoWidth),
                SizedBox(
                  height: mediaQuerryHeight(context) * 0.025,
                ),
                Column(
                  children: [
                    splashWidget.buildContentText(
                      context,
                      'YOUR PERSONALIZED PATHWAY',
                      contentFontSize,
                    ),
                    splashWidget.buildContentText(
                      context,
                      'TO THRIVING IN QUALITY',
                      contentFontSize,
                    ),
                    splashWidget.buildContentText(
                      context,
                      'ASSURANCE',
                      contentFontSize,
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
