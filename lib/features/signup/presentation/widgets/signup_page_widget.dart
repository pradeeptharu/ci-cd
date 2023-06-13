import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_button.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field.dart';
import 'package:qa_lint/features/login/presentation/pages/login_page.dart';
import 'package:qa_lint/features/profile/presentation/pages/profile_page.dart';

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
    final orientations = MediaQuery.of(context).orientation;
    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrantation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrantation == Orientation.landscape;
        double widthFactor = _isTablet(context)
            ? mediaQuerryWidth(context) * 0.0011
            : mediaQuerryWidth(context) * 0.0026;

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
                firstNameTextFormField(context, isLandscape, orientations),
                lastNameTextFormField(context, isLandscape, orientations),
                phoneNumberTextFormField(context, isLandscape, orientations),
                emailTextFormField(context, isLandscape, orientations),
                passwordTextFormField(context, isLandscape, orientations),
                confirmPasswordTextFormField(
                    context, isLandscape, orientations),
                // SignupFormFields(
                //     isLandscape: isLandscape, orientation: orientation),
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
                          text: 'I have read and agree to the ',
                          fontSize: _isTablet(context)
                              ? (orientations == Orientation.landscape
                                  ? tabletLandscapeFontSize(context)
                                  : tabletFontSize(context))
                              : defultFontSize(context),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: customText(
                            color: AppColor.buttonColor,
                            text: 'Privacy Policy',
                            fontSize: _isTablet(context)
                                ? (orientations == Orientation.landscape
                                    ? tabletLandscapeFontSize(context)
                                    : tabletFontSize(context))
                                : defultFontSize(context),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        print('terms and conditgions');
                      },
                      child: customText(
                        text: 'Terms and Conditions',
                        color: AppColor.buttonColor,
                        fontSize: _isTablet(context)
                            ? (orientations == Orientation.landscape
                                ? tabletLandscapeFontSize(context)
                                : tabletFontSize(context))
                            : defultFontSize(context),
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
                          text: 'Don you have an account?',
                          fontSize: _isTablet(context)
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
                                  builder: (context) => const LoginPage(),
                                ));
                          },
                          child: customText(
                            text: 'Log in',
                            color: AppColor.buttonColor,
                            fontSize: _isTablet(context)
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget confirmPasswordTextFormField(
      BuildContext context, bool isLandscape, Orientation orientations) {
    return customTextFormField(
      context: context,
      validator: validator.confirmPasswordValidator,
      controller: signupTextEditingController.confirmPasswordController,
      textInputAction: TextInputAction.done,
      obscureText: _isPasswordVisible,
      contentPadding: _isTablet(context)
          ? isLandscape
              ? EdgeInsets.all(
                  paddingTabletLandscape35(context),
                )
              : EdgeInsets.all(paddingTablet30(context))
          : EdgeInsets.all(paddingMobile10(context)),
      labelText: 'Re-enter password',
      labelStyle: labelStyle(
        fontSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? tabletLandscapeFontSize(context)
                : tabletFontSize(context))
            : defultFontSize(context),
      ),
      prefixIcon: Icons.key_rounded,
      suffixIcon: IconButton(
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
        icon:
            Icon(_isPasswordVisible ? Icons.visibility : Icons.visibility_off),
        iconSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? iconSizeTabletLandscape(context)
                : iconSizeTablet(context))
            : iconSizeMobile(context),
      ),
    );
  }

  Widget passwordTextFormField(
      BuildContext context, bool isLandscape, Orientation orientations) {
    return customTextFormField(
      context: context,
      validator: validator.passwordValidator,
      controller: signupTextEditingController.passwordController,
      textInputAction: TextInputAction.next,
      obscureText: _isPasswordVisible,
      contentPadding: _isTablet(context)
          ? isLandscape
              ? EdgeInsets.all(
                  paddingTabletLandscape35(context),
                )
              : EdgeInsets.all(paddingTablet30(context))
          : EdgeInsets.all(paddingMobile10(context)),
      labelText: 'Password',
      labelStyle: labelStyle(
        fontSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? tabletLandscapeFontSize(context)
                : tabletFontSize(context))
            : defultFontSize(context),
      ),
      prefixIcon: Icons.key_rounded,
    );
  }

  Widget phoneNumberTextFormField(
      BuildContext context, bool isLandscape, Orientation orientations) {
    return customTextFormField(
      context: context,
      validator: validator.phoneValidator,
      controller: signupTextEditingController.phoneNumberController,
      textInputAction: TextInputAction.next,
      contentPadding: _isTablet(context)
          ? isLandscape
              ? EdgeInsets.all(
                  paddingTabletLandscape35(context),
                )
              : EdgeInsets.all(paddingTablet30(context))
          : EdgeInsets.all(paddingMobile10(context)),
      labelText: 'Phone Number',
      labelStyle: labelStyle(
        fontSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? tabletLandscapeFontSize(context)
                : tabletFontSize(context))
            : defultFontSize(context),
      ),
      prefixIcon: Icons.phone,
      keyboardType: TextInputType.number,
    );
  }

  Widget emailTextFormField(
      BuildContext context, bool isLandscape, Orientation orientations) {
    return customTextFormField(
      context: context,
      validator: validator.emailValidator,
      controller: signupTextEditingController.emailController,
      textInputAction: TextInputAction.next,
      contentPadding: _isTablet(context)
          ? isLandscape
              ? EdgeInsets.all(
                  paddingTabletLandscape35(context),
                )
              : EdgeInsets.all(paddingTablet30(context))
          : EdgeInsets.all(paddingMobile10(context)),
      labelText: 'Email',
      labelStyle: labelStyle(
        fontSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? tabletLandscapeFontSize(context)
                : tabletFontSize(context))
            : defultFontSize(context),
      ),
      prefixIcon: Icons.email,
    );
  }

  Widget lastNameTextFormField(
      BuildContext context, bool isLandscape, Orientation orientations) {
    return customTextFormField(
      context: context,
      validator: validator.lastNameValidator,
      controller: signupTextEditingController.lastNameController,
      textInputAction: TextInputAction.next,
      contentPadding: _isTablet(context)
          ? isLandscape
              ? EdgeInsets.all(
                  paddingTabletLandscape35(context),
                )
              : EdgeInsets.all(paddingTablet30(context))
          : EdgeInsets.all(paddingMobile10(context)),
      labelText: 'Last Name',
      labelStyle: labelStyle(
        fontSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? tabletLandscapeFontSize(context)
                : tabletFontSize(context))
            : defultFontSize(context),
      ),
      prefixIcon: Icons.person,
    );
  }

  Widget firstNameTextFormField(
      BuildContext context, bool isLandscape, Orientation orientations) {
    return customTextFormField(
      context: context,
      validator: validator.firstNameValidator,
      controller: signupTextEditingController.firstNameController,
      textInputAction: TextInputAction.next,
      contentPadding: _isTablet(context)
          ? isLandscape
              ? EdgeInsets.all(
                  paddingTabletLandscape35(context),
                )
              : EdgeInsets.all(paddingTablet30(context))
          : EdgeInsets.all(paddingMobile10(context)),
      labelText: 'First Name',
      labelStyle: labelStyle(
        fontSize: _isTablet(context)
            ? (orientations == Orientation.landscape
                ? tabletLandscapeFontSize(context)
                : tabletFontSize(context))
            : defultFontSize(context),
      ),
      prefixIcon: Icons.person,
    );
  }
}
