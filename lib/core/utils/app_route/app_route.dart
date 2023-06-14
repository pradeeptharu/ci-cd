import 'package:flutter/material.dart';
import 'package:qa_lint/features/login/presentation/pages/login_page.dart';
import 'package:qa_lint/features/signup/presentation/pages/signup_page.dart';
import 'package:qa_lint/features/splash/presentation/pages/splash_page.dart';

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
