import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/services.dart/api_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider()..fetchQuizData(),
      child: const MaterialApp(
        title: 'Flutter Demo',
        home: QuizPage(),
      ),
    );
  }
}
