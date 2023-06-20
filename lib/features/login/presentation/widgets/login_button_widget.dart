import 'package:qa_lint/core/utils/constants/exports.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
    required this.formKey,
    required this.loginTextEditingController,
    required this.dialogTitleFontSize,
    required this.dialogContentFontSize,
    required this.dialogWidth,
    required this.dialogHeight,
    required this.isLandscape,
  });

  final GlobalKey<FormState> formKey;
  final LoginTextEditingController loginTextEditingController;
  final double dialogTitleFontSize;
  final double dialogContentFontSize;
  final double dialogWidth;
  final double dialogHeight;
  final bool isLandscape;

  @override
  Widget build(BuildContext context) {
    bool _isTablet(BuildContext context) {
      final shortestSide = MediaQuery.of(context).size.shortestSide;
      return shortestSide >= 600;
    }

    return CustomButton(
      text: 'Login',
      onPressed: () {
        if (formKey.currentState!.validate()) {
          final email = loginTextEditingController.emailController.text;
          if (Provider.of<InternetConnectionStates>(context, listen: false)
              .hasInternet) {
            Provider.of<SignUpUserDataProvider>(context, listen: false)
                .setUserData(email, '', '', '');
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const QuizLandingPage(),
              ),
            );
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialogWidget(
                    title: 'No Internet Connection',
                    content:
                        'Make sure that Wi-Fi or mobile data is turned on, then try again ',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    dialogTitleFontSize: dialogTitleFontSize,
                    dialogContentFontSize: dialogContentFontSize,
                    dialogWidth: dialogWidth,
                    dialogHeight: dialogHeight,
                    isTablet: _isTablet(context),
                    isLandscape: isLandscape);
              },
            );
          }
        }
      },
    );
  }
}
