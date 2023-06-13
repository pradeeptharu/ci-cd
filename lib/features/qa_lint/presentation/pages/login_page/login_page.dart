import 'dart:math';

import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_button.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/signup_page/signup_page.dart';
import 'package:qa_lint/features/qa_lint/presentation/widgets/login_page_widgets/login_page_widget.dart';
import 'package:qa_lint/features/qa_lint/presentation/widgets/login_page_widgets/login_with_google.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  bool value = false;
  @override
  @override
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;

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
                          : mediaQuerryHeight(context) * 0.3,
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
                            text: 'Forgot your password?',
                            fontSize: isTablet()
                                ? (orientations == Orientation.landscape
                                    ? tabletLandscapeFontSize(context)
                                    : tabletFontSize(context))
                                : defultFontSize(context),
                            color: AppColor.buttonColor,
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
                          text: 'Remember me',
                          fontSize: isTablet()
                              ? (orientations == Orientation.landscape
                                  ? tabletLandscapeFontSize(context)
                                  : tabletFontSize(context))
                              : defultFontSize(context),
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
                    height: mediaQuerryHeight(context) * 0.02,
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
                          text: 'OR',
                          fontSize: isTablet()
                              ? (orientations == Orientation.landscape
                                  ? tabletLandscapeFontSize(context)
                                  : tabletFontSize(context))
                              : defultFontSize(context),
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
                  commonSizedBox(context),

                  LoginWithGoogle(
                    onPressed: () {},
                    text: 'Login with Google',
                  ),

                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      customText(
                        text: 'Don\'t have an account?',
                        fontSize: isTablet()
                            ? (orientations == Orientation.landscape
                                ? tabletLandscapeFontSize(context)
                                : tabletFontSize(context))
                            : defultFontSize(context),
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
                          text: 'Sign up',
                          color: AppColor.buttonColor,
                          fontSize: isTablet()
                              ? (orientations == Orientation.landscape
                                  ? tabletLandscapeFontSize(context)
                                  : tabletFontSize(context))
                              : defultFontSize(context),
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
