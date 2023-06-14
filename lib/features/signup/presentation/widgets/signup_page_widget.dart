import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_button.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/features/login/presentation/pages/login_page.dart';
import 'package:qa_lint/features/profile/presentation/pages/profile_page.dart';
import 'package:qa_lint/features/signup/presentation/widgets/sign_up_form_field.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  bool value = false;
  SignupTextEditingController signupTextEditingController =
      SignupTextEditingController();
  Validator validator = Validator();
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
        double widthFactor = _isTablet(context)
            ? mediaQuerryWidth(context) * 0.0011
            : mediaQuerryWidth(context) * 0.0028;

        if (isLandscape) {
          widthFactor *= 0.7;
        }

        print(deviceOrantation);

        return Form(
          key: formKey,
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: widthFactor,
            child: Column(
              children: [
                Image.asset(
                  ImagePath.logoQaLint,
                  fit: BoxFit.cover,
                  height: _isTablet(context)
                      ? mediaQuerryHeight(context) * 0.2
                      : mediaQuerryHeight(context) * 0.133,
                ),
                const SignupFormFields(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: _isTablet(context)
                          ? mediaQuerryHeight(context) * 0.03
                          : mediaQuerryHeight(context) * 0.01,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Transform.scale(
                          scale: _isTablet(context) ? 1.6 : 1,
                          child: Checkbox(
                            value: value,
                            onChanged: (value) {
                              setState(() {
                                this.value = value!;
                              });
                            },
                          ),
                        ),
                        customText(
                            context: context,
                            text: 'I have read and agree to the ',
                            color: AppColor.titleTextColor),
                        GestureDetector(
                          onTap: () {},
                          child: customText(
                            context: context,
                            text: 'Privacy Policy',
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print('terms and conditgions');
                      },
                      child: customText(
                        context: context,
                        text: 'Terms and Conditions',
                      ),
                    ),
                    SizedBox(
                      height: _isTablet(context)
                          ? mediaQuerryHeight(context) * 0.03
                          : mediaQuerryHeight(context) * 0.02,
                    ),
                    CustomButton(
                      text: 'Sign up',
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilePage(
                                email: signupTextEditingController
                                    .emailController.text,
                                name: signupTextEditingController
                                    .firstNameController.text,
                                phoneNumber: signupTextEditingController
                                    .phoneNumberController.text,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(
                      height: _isTablet(context)
                          ? mediaQuerryHeight(context) * 0.035
                          : mediaQuerryHeight(context) * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        customText(
                          context: context,
                          text: 'Don you have an account?',
                        ),
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
            ),
          ),
        );
      },
    );
  }
}
