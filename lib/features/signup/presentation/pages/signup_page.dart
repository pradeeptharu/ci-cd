import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/features/signup/presentation/widgets/signup_page_widget.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: ListView(
          children: [
            commonSizedBox(context),
            const SignUpPageWidget(),
          ],
        ),
      ),
    );
  }
}
