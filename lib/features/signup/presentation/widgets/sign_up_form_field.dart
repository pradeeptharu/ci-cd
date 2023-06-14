import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({super.key});

  @override
  State<SignupFormFields> createState() => _SignupFormFieldsState();
}

class _SignupFormFieldsState extends State<SignupFormFields> {
  bool _isPasswordVisible = true;
  Validator validator = Validator();

  SignupTextEditingController signupTextEditingController =
      SignupTextEditingController();
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;
    return Column(
      children: [
        customTextFormField(
            prefixIcon: Icons.person_4_rounded,
            context: context,
            labelText: 'First Name',
            validator: validator.firstNameValidator,
            textInputAction: TextInputAction.done,
            controller: signupTextEditingController.firstNameController),
        customTextFormField(
            prefixIcon: Icons.person_4_rounded,
            context: context,
            labelText: 'Last Name',
            validator: validator.lastNameValidator,
            textInputAction: TextInputAction.done,
            controller: signupTextEditingController.lastNameController),
        customTextFormField(
            prefixIcon: Icons.email,
            context: context,
            labelText: 'Email',
            validator: validator.emailValidator,
            textInputAction: TextInputAction.done,
            controller: signupTextEditingController.emailController),
        customTextFormField(
            prefixIcon: Icons.phone,
            context: context,
            labelText: 'Phone Number',
            validator: validator.phoneValidator,
            textInputAction: TextInputAction.done,
            controller: signupTextEditingController.phoneNumberController),
        customTextFormField(
            prefixIcon: Icons.key,
            context: context,
            labelText: 'Password',
            validator: validator.passwordValidator,
            textInputAction: TextInputAction.done,
            controller: signupTextEditingController.passwordController),
        customTextFormField(
          prefixIcon: Icons.key,
          context: context,
          labelText: 'Confirm Password',
          validator: validator.confirmPasswordValidator,
          textInputAction: TextInputAction.done,
          controller: signupTextEditingController.confirmPasswordController,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                _isPasswordVisible = !_isPasswordVisible;
              });
            },
            icon: Icon(
              _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              size: _isTablet(context)
                  ? (orientations == Orientation.landscape
                      ? iconSizeTabletLandscape(context)
                      : iconSizeTablet(context))
                  : iconSizeMobile(context),
            ),
          ),
        ),
      ],
    );
  }
}
