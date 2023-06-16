import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field_widget.dart';
import 'package:qa_lint/features/signup/presentation/provider/password_visibility_provider.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  LoginTextEditingController loginEditingController =
      LoginTextEditingController();
  Validator validator = Validator();
  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);

    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            customTextFormField(
                prefixIcon: Icons.email,
                context: context,
                labelText: 'Email',
                validator: validator.emailValidator,
                textInputAction: TextInputAction.next,
                controller: loginEditingController.emailController),
            customTextFormField(
              obscureText: !passwordVisibilityProvider.isPasswordVisible,
              prefixIcon: Icons.key,
              context: context,
              labelText: 'Password',
              validator: validator.passwordValidator,
              textInputAction: TextInputAction.done,
              controller: loginEditingController.passwordController,
              suffixIcon: IconButton(
                onPressed: () {
                  passwordVisibilityProvider.togglePasswordVisibility();
                },
                icon: Icon(
                  passwordVisibilityProvider.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  size: isTablet()
                      ? (orientations == Orientation.landscape
                          ? iconSizeTabletLandscape(context)
                          : iconSizeTablet(context))
                      : iconSizeMobile(context),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
