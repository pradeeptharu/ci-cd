import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/signup/presentation/provider/signup_user_data_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpUserData = Provider.of<SignUpUserDataProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customText(
                context: context, text: 'Email: ${signUpUserData.email}'),
            customText(
                context: context,
                text: 'First Name: ${signUpUserData.firstName}'),
            customText(
                context: context,
                text: 'Last Name: ${signUpUserData.lastName}'),
          ],
        ),
      ),
    );
  }
}
