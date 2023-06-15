import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/constants/validator_textformfield.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_button_widget.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textedting_controller.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_textform_field_widget.dart';

class ForgotPasswordPage extends StatefulWidget {
  ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool _isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final deviceOrantation = MediaQuery.of(context).orientation;
    bool isLandscape = deviceOrantation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: _isTablet(context)
                ? isLandscape
                    ? mediaQuerryHeight(context) * 0.05
                    : mediaQuerryHeight(context) * 0.035
                : mediaQuerryHeight(context) * 0.04,
            color: AppColor.titleTextColor,
          ),
          onPressed: () {
            Navigator.pushNamed(context, 'loginPage');
          },
        ),
        backgroundColor: AppColor.backgroundColor,
        elevation: 0,
        title: customText(
          context: context,
          text: 'Forgot Password',
          fontSize: isLandscape
              ? mediaQuerryHeight(context) * 0.05
              : mediaQuerryHeight(context) * 0.03,
          color: AppColor.titleTextColor,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: mediaQuerryHeight(context) * 0.05,
              ),
              Container(
                alignment: Alignment.center,
                height: mediaQuerryHeight(context) * 0.3,
                child: Image.asset(
                  ImagePath.logoQaLint,
                  fit: BoxFit.cover,
                ),
              ),
              customTextFormField(
                  context: context,
                  labelText: 'Email',
                  validator: Validator().emailValidator,
                  textInputAction: TextInputAction.done,
                  controller: LoginTextEditingController().emailController,
                  prefixIcon: Icons.email),
              SizedBox(
                height: mediaQuerryHeight(context) * 0.03,
              ),
              SizedBox(
                width: mediaQuerryWidth(context) * 0.6,
                child: CustomButton(
                  text: 'Email Reset Link',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
              ),
              SizedBox(
                height: mediaQuerryHeight(context) * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  customText(
                      context: context,
                      text: 'Do you have an account?',
                      color: AppColor.titleTextColor),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/loginPage');
                    },
                    child: customText(context: context, text: 'Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
