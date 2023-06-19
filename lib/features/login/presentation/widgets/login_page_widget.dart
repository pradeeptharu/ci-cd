import 'package:flutter/material.dart';
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
    return OrientationBuilder(
      builder: (context, orientation) {
        return Column(
          children: [
            customTextFormField(
                prefixIcon: Icons.email,
                context: context,
                labelText: 'Email',
                validator: validator.emailValidator,
                textInputAction: TextInputAction.done,
                controller: loginEditingController.emailController),
            customTextFormField(
              prefixIcon: Icons.key,
              context: context,
              labelText: 'Password',
              validator: validator.passwordValidator,
              textInputAction: TextInputAction.done,
              controller: loginEditingController.passwordController,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
