import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  LoginTextEditingController loginEditingController =
      LoginTextEditingController();
  Validator validator = Validator();
  bool _isPasswordVisible = true;
  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;

    return OrientationBuilder(
      builder: (context, orientation) {
        final deviceOrientation = MediaQuery.of(context).orientation;
        bool isLandscape = deviceOrientation == Orientation.landscape;

        return FractionallySizedBox(
          child: Column(
            children: [
              // Email TextForm Fild for login page
              customTextFormField(
                textInputAction: TextInputAction.next,
                context: context,
                controller: loginEditingController.emailController,
                contentPadding: isTablet()
                    ? (orientations == Orientation.landscape
                        ? const EdgeInsets.symmetric(vertical: 25)
                        : const EdgeInsets.all(30))
                    : const EdgeInsets.all(10),
                labelText: 'Email',
                labelStyle: labelStyle(
                  fontSize: isTablet()
                      ? (orientations == Orientation.landscape
                          ? tabletLandscapeFontSize(context)
                          : tabletFontSize(context))
                      : defultFontSize(context),
                ),
                prefixIcon: Icons.email,
                validator: validator.emailValidator,
              ),
              // Password TextFormFiled for login page
              customTextFormField(
                context: context,
                validator: validator.passwordValidator,
                controller: loginEditingController.passwordController,
                obscureText: _isPasswordVisible,
                contentPadding: isTablet()
                    ? (orientations == Orientation.landscape
                        ? const EdgeInsets.symmetric(vertical: 25)
                        : const EdgeInsets.all(30))
                    : const EdgeInsets.all(10),
                labelText: 'Password',
                labelStyle: labelStyle(
                  fontSize: isTablet()
                      ? (orientations == Orientation.landscape
                          ? tabletLandscapeFontSize(context)
                          : tabletFontSize(context))
                      : defultFontSize(context),
                ),
                prefixIcon: Icons.key,
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    size: isTablet() ? 30 : 20,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
