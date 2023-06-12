import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_widgets.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/login_page/login_page.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/profile_page/profile_page.dart';

class SignUpPageWidget extends StatefulWidget {
  const SignUpPageWidget({super.key});

  @override
  State<SignUpPageWidget> createState() => _SignUpPageWidgetState();
}

class _SignUpPageWidgetState extends State<SignUpPageWidget> {
  bool _isPasswordVisible = true;
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
    return Form(
      key: formKey,
      child: FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: _isTablet(context)
            ? mediaQuerryWidth(context) * 0.0001
            : mediaQuerryWidth(context) * 0.0027,
        child: Column(
          children: [
            Image.asset(
              ImagePath.qaLintLogo,
              fit: BoxFit.cover,
              height: mediaQuerryHeight(context) * 0.11,
            ),
            commonSizedBox(context),
            customTextFormField(
              context: context,
              validator: validator.firstNameValidator,
              controller: signupTextEditingController.firstNameController,
              textInputAction: TextInputAction.next,
              contentPadding: _isTablet(context)
                  ? const EdgeInsets.all(30)
                  : const EdgeInsets.all(10),
              labelText: 'First Name',
              labelStyle: labelStyle(
                fontSize: _isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
              ),
              prefixIcon: Icons.person,
            ),
            customTextFormField(
              context: context,
              validator: validator.lastNameValidator,
              controller: signupTextEditingController.lastNameController,
              textInputAction: TextInputAction.next,
              contentPadding: _isTablet(context)
                  ? EdgeInsets.all(paddingTablet30(context))
                  : EdgeInsets.all(paddingMobile10(context)),
              labelText: 'Last Name',
              labelStyle: labelStyle(
                fontSize: _isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
              ),
              prefixIcon: Icons.person,
            ),
            customTextFormField(
              context: context,
              validator: validator.emailValidator,
              controller: signupTextEditingController.emailController,
              textInputAction: TextInputAction.next,
              contentPadding: _isTablet(context)
                  ? const EdgeInsets.all(30)
                  : const EdgeInsets.all(10),
              labelText: 'Email',
              labelStyle: labelStyle(
                fontSize: _isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
              ),
              prefixIcon: Icons.email,
            ),
            customTextFormField(
              context: context,
              validator: validator.phoneValidator,
              controller: signupTextEditingController.phoneNumberController,
              textInputAction: TextInputAction.next,
              contentPadding: _isTablet(context)
                  ? const EdgeInsets.all(30)
                  : const EdgeInsets.all(10),
              labelText: 'Phone Number',
              labelStyle: labelStyle(
                fontSize: _isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
              ),
              prefixIcon: (Icons.phone),
              keyboardType: TextInputType.number,
            ),
            customTextFormField(
              context: context,
              validator: validator.passwordValidator,
              controller: signupTextEditingController.passwordController,
              textInputAction: TextInputAction.next,
              obscureText: _isPasswordVisible,
              contentPadding: _isTablet(context)
                  ? const EdgeInsets.all(30)
                  : const EdgeInsets.all(10),
              labelText: 'Password',
              labelStyle: labelStyle(
                fontSize: _isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
              ),
              prefixIcon: Icons.key_rounded,
            ),
            customTextFormField(
              context: context,
              validator: validator.confirmPasswordValidator,
              controller: signupTextEditingController.confirmPasswordController,
              textInputAction: TextInputAction.done,
              obscureText: _isPasswordVisible,
              contentPadding: _isTablet(context)
                  ? const EdgeInsets.all(30)
                  : const EdgeInsets.all(10),
              labelText: 'Re-enter password',
              labelStyle: labelStyle(
                fontSize: _isTablet(context)
                    ? tabletFontSize(context)
                    : defultFontSize(context),
              ),
              prefixIcon: Icons.key_rounded,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: Icon(_isPasswordVisible
                    ? Icons.visibility
                    : Icons.visibility_off),
                iconSize: _isTablet(context)
                    ? iconSizeTablet(context)
                    : iconSizeMobile(context),
              ),
            ),
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
                    normalText(
                      text: 'I have read and agree to the',
                      fontSize: _isTablet(context)
                          ? tabletFontSize(context)
                          : defultFontSize(context),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: normalText(
                        text: 'Privacy Policy',
                        fontSize: _isTablet(context)
                            ? tabletFontSize(context)
                            : defultFontSize(context),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: normalText(
                        text: 'Terms and Conditions',
                        fontSize: _isTablet(context)
                            ? tabletFontSize(context)
                            : defultFontSize(context),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _isTablet(context)
                      ? mediaQuerryHeight(context) * 0.03
                      : 0,
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
                      ? mediaQuerryHeight(context) * 0.1
                      : mediaQuerryHeight(context) * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    normalText(
                      text: 'Don you have an account?',
                      fontSize: _isTablet(context)
                          ? tabletFontSize(context)
                          : defultFontSize(context),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ));
                      },
                      child: normalText(
                        text: 'Log in',
                        color: AppColor.buttonColor,
                        fontSize: _isTablet(context)
                            ? tabletFontSize(context)
                            : defultFontSize(context),
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
  }
}
