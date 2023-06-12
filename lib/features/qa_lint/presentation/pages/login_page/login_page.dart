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
  late AnimationController _controller;
  late Animation<double> _animation;
  bool value = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    );
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOutBack);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: mediaQuerryHeight(context) * 0.1,
                ),
                // Logo Image
                Center(
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: 2 * pi * _animation.value,
                        child: child,
                      );
                    },
                    child: Image.asset(
                      ImagePath.qaLintLogo,
                      fit: BoxFit.cover,
                      height: mediaQuerryHeight(context) * 0.2,
                    ),
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
                              ? tabletFontSize(context)
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
                            ? tabletFontSize(context)
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
                            ? tabletFontSize(context)
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
                  text: 'Log in with Google',
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customText(
                      text: 'Don\'t have an account?',
                      fontSize: isTablet()
                          ? tabletFontSize(context)
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
                            ? tabletFontSize(context)
                            : defultFontSize(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
