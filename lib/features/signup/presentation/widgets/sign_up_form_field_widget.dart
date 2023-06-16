import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field_widget.dart';
import 'package:qa_lint/features/signup/presentation/widgets/intelphone_field_widget.dart';
import 'package:qa_lint/features/signup/presentation/provider/password_visibility_provider.dart';

class SignupFormFields extends StatefulWidget {
  const SignupFormFields({super.key});

  @override
  State<SignupFormFields> createState() => _SignupFormFieldsState();
}

class _SignupFormFieldsState extends State<SignupFormFields> {
  Validator validator = Validator();

  SignupTextEditingController signupTextEditingController =
      SignupTextEditingController();
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  bool isPasswordMatch() {
    final password = signupTextEditingController.passwordController.text;
    final confirmPassword =
        signupTextEditingController.confirmPasswordController.text;
    return password == confirmPassword;
  }

  @override
  Widget build(BuildContext context) {
    final orientations = MediaQuery.of(context).orientation;
    final passwordVisibilityProvider =
        Provider.of<PasswordVisibilityProvider>(context);

    return Column(
      children: [
        customTextFormField(
            prefixIcon: Icons.person_4_rounded,
            context: context,
            labelText: 'First Name',
            validator: validator.firstNameValidator,
            textInputAction: TextInputAction.next,
            controller: signupTextEditingController.firstNameController),
        customTextFormField(
            prefixIcon: Icons.person_4_rounded,
            context: context,
            labelText: 'Last Name',
            validator: validator.lastNameValidator,
            textInputAction: TextInputAction.next,
            controller: signupTextEditingController.lastNameController),
        customTextFormField(
            prefixIcon: Icons.email,
            context: context,
            labelText: 'Email',
            validator: validator.emailValidator,
            textInputAction: TextInputAction.next,
            controller: signupTextEditingController.emailController),
        // customTextFormField(
        //     prefixIcon: Icons.phone,
        //     context: context,
        //     labelText: 'Phone Number',
        //     validator: validator.phoneValidator,
        //     textInputAction: TextInputAction.done,
        //     controller: signupTextEditingController.phoneNumberController),
        customIntlPhoneTextFormField(
            prefixIcon: Icons.email,
            context: context,
            labelText: 'Phone Number',
            // validator: (value) {
            //   if (value.isUndefined) {
            //     return 'Please Enter Number';
            //   }
            //   return null;
            // },
            textInputAction: TextInputAction.next,
            controller: signupTextEditingController.phoneNumberController),

        customTextFormField(
          obscureText: !passwordVisibilityProvider.isPasswordVisible,
          prefixIcon: Icons.key,
          context: context,
          labelText: 'Password',
          validator: validator.passwordValidator,
          textInputAction: TextInputAction.next,
          controller: signupTextEditingController.passwordController,
          suffixIcon: IconButton(
            onPressed: () {
              passwordVisibilityProvider.togglePasswordVisibility();
            },
            icon: Icon(
              passwordVisibilityProvider.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              size: _isTablet(context)
                  ? (orientations == Orientation.landscape
                      ? iconSizeTabletLandscape(context)
                      : iconSizeTablet(context))
                  : iconSizeMobile(context),
            ),
          ),
        ),
        customTextFormField(
          obscureText: !passwordVisibilityProvider.isPasswordVisible,
          prefixIcon: Icons.key,
          context: context,
          labelText: 'Confirm Password',
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Confirm Password is required';
            }
            if (!isPasswordMatch()) {
              return 'Password does not match';
            }
            return null;
          },
          textInputAction: TextInputAction.done,
          controller: signupTextEditingController.confirmPasswordController,
          suffixIcon: IconButton(
            onPressed: () {
              passwordVisibilityProvider.togglePasswordVisibility();
            },
            icon: Icon(
              passwordVisibilityProvider.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
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
