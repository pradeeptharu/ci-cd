import 'package:flutter/material.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/login_page/login_page.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/signup_page/signup_page.dart';
import 'package:qa_lint/features/qa_lint/presentation/pages/splash_page/splash_page.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());

      case '/loginPage':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/signupPage':
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case '/customNavigationBar':
      default:
        return MaterialPageRoute(builder: (_) => const SplashPage());
    }
  }
}
