import 'package:qa_lint/core/utils/constants/exports.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  bool value = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrantation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrantation == Orientation.landscape;
        // ignore: unused_local_variable
        double widthFactor = _isTablet(context)
            ? mediaQuerryWidth(context) * 0.0011
            : mediaQuerryWidth(context) * 0.0028;

        if (isLandscape) {
          widthFactor *= 0.7;
        }

        print(deviceOrantation);

        return Column(
          children: [
            Image.asset(
              ImagePath.logoQaLint,
              fit: BoxFit.cover,
              height: _isTablet(context)
                  ? mediaQuerryHeight(context) * 0.2
                  : mediaQuerryHeight(context) * 0.133,
            ),
            const SignupFormFields(),
            SizedBox(
              height: _isTablet(context)
                  ? isLandscape
                      ? mediaQuerryHeight(context) * 0.035
                      : mediaQuerryHeight(context) * 0.09
                  : mediaQuerryHeight(context) * 0.04,
            ),
            const TermsAndConditionTextWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: _isTablet(context)
                      ? mediaQuerryHeight(context) * 0.03
                      : mediaQuerryHeight(context) * 0.001,
                ),
                SizedBox(
                  height: _isTablet(context)
                      ? isLandscape
                          ? mediaQuerryHeight(context) * 0.035
                          : mediaQuerryHeight(context) * 0.09
                      : mediaQuerryHeight(context) * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                        context: context,
                        text: 'Do you have an account?',
                        color: AppColor.titleTextColor),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: customText(
                        context: context,
                        text: 'Log in',
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
