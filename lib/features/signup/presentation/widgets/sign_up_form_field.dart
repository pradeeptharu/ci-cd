import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field.dart';

class SignupFormFields extends StatefulWidget {
  final bool isLandscape;
  final Orientation orientation;

  const SignupFormFields({
    required this.isLandscape,
    required this.orientation,
  });

  @override
  State<SignupFormFields> createState() => _SignupFormFieldsState();
}

class _SignupFormFieldsState extends State<SignupFormFields> {
  bool _isPasswordVisible = true;
  Validator validator = Validator();
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  SignupTextEditingController signupTextEditingController =
      SignupTextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        customTextFormField(
          context: context,
          validator: validator.firstNameValidator,
          controller: signupTextEditingController.firstNameController,
          textInputAction: TextInputAction.next,
          contentPadding: _isTablet(context)
              ? widget.isLandscape
                  ? EdgeInsets.all(paddingTabletLandscape35(context))
                  : EdgeInsets.all(paddingTablet30(context))
              : EdgeInsets.all(paddingMobile10(context)),
          labelText: 'First Name',
          labelStyle: labelStyle(
            fontSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
                    ? tabletLandscapeFontSize(context)
                    : tabletFontSize(context))
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
              ? widget.isLandscape
                  ? EdgeInsets.all(paddingTabletLandscape35(context))
                  : EdgeInsets.all(paddingTablet30(context))
              : EdgeInsets.all(paddingMobile10(context)),
          labelText: 'Last Name',
          labelStyle: labelStyle(
            fontSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
                    ? tabletLandscapeFontSize(context)
                    : tabletFontSize(context))
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
              ? widget.isLandscape
                  ? EdgeInsets.all(paddingTabletLandscape35(context))
                  : EdgeInsets.all(paddingTablet30(context))
              : EdgeInsets.all(paddingMobile10(context)),
          labelText: 'Email',
          labelStyle: labelStyle(
            fontSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
                    ? tabletLandscapeFontSize(context)
                    : tabletFontSize(context))
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
              ? widget.isLandscape
                  ? EdgeInsets.all(paddingTabletLandscape35(context))
                  : EdgeInsets.all(paddingTablet30(context))
              : EdgeInsets.all(paddingMobile10(context)),
          labelText: 'Phone Number',
          labelStyle: labelStyle(
            fontSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
                    ? tabletLandscapeFontSize(context)
                    : tabletFontSize(context))
                : defultFontSize(context),
          ),
          prefixIcon: Icons.phone,
          keyboardType: TextInputType.number,
        ),
        customTextFormField(
          context: context,
          validator: validator.passwordValidator,
          controller: signupTextEditingController.passwordController,
          textInputAction: TextInputAction.next,
          obscureText: _isPasswordVisible,
          contentPadding: _isTablet(context)
              ? widget.isLandscape
                  ? EdgeInsets.all(paddingTabletLandscape35(context))
                  : EdgeInsets.all(paddingTablet30(context))
              : EdgeInsets.all(paddingMobile10(context)),
          labelText: 'Password',
          labelStyle: labelStyle(
            fontSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
                    ? tabletLandscapeFontSize(context)
                    : tabletFontSize(context))
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
              ? widget.isLandscape
                  ? EdgeInsets.all(paddingTabletLandscape35(context))
                  : EdgeInsets.all(paddingTablet30(context))
              : EdgeInsets.all(paddingMobile10(context)),
          labelText: 'Re-enter password',
          labelStyle: labelStyle(
            fontSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
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
            icon: Icon(
              _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            iconSize: _isTablet(context)
                ? (widget.orientation == Orientation.landscape
                    ? iconSizeTabletLandscape(context)
                    : iconSizeTablet(context))
                : iconSizeMobile(context),
          ),
        ),
      ],
    );
  }
}
