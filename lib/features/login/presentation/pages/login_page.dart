import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_button.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/signup/presentation/pages/signup_page.dart';
import 'package:qa_lint/features/login/presentation/widgets/login_page_widget.dart';
import 'package:qa_lint/features/login/presentation/widgets/login_with_google.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool value = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: OrientationBuilder(builder: (context, orientation) {
        return SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: isTablet()
                        ? mediaQuerryHeight(context) * 0.05
                        : mediaQuerryHeight(context) * 0.1,
                  ),
                  // Logo Image
                  Center(
                    child: Image.asset(
                      ImagePath.logoQaLint,
                      fit: BoxFit.contain,
                      height: isTablet()
                          ? mediaQuerryHeight(context) * 0.2
                          : mediaQuerryHeight(context) * 0.1,
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerryHeight(context) * 0.05,
                  ),

                  /// TextFiled Widget For Email And password
                  const LoginPageWidget(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQuerryHeight(context) * 0.03,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: customText(
                            context: context,
                            text: 'Forgot your password?',
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: mediaQuerryHeight(context) * 0.015,
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          value: value,
                          onChanged: (value) {
                            setState(() {
                              this.value = value!;
                            });
                          },
                        ),
                        customText(
                          context: context,
                          text: 'Remember me',
                        ),
                      ],
                    ),
                  ),
                  commonSizedBox(context),
                  Center(
                    child: CustomButton(
                      text: 'Login',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ProfileScreen(),
                          //   ),
                          // );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: mediaQuerryHeight(context) * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: mediaQuerryHeight(context) * 0.015,
                        ),
                        child: customText(
                          context: context,
                          text: 'OR',
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  /// Login with google widget
                  LoginWithGoogle(
                    onPressed: () {},
                    text: 'Login with Google',
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        context: context,
                        text: 'Don\'t have an account?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            ),
                          );
                        },
                        child: customText(
                          context: context,
                          text: 'Sign up',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}