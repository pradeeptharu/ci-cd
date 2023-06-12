import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String name;
  final String email;
  final String phoneNumber;

  const ProfilePage(
      {super.key,
      required this.name,
      required this.email,
      required this.phoneNumber});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name),
            Text(email),
            Text(phoneNumber),
          ],
        ),
      ),
    );
  }
}
