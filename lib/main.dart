import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qa_lint/core/utils/app_route/app_route.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/features/signup/presentation/provider/checkbox_visibility_provider.dart';
import 'package:qa_lint/features/signup/presentation/provider/password_visibility_provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  runApp(QALint());
}

class QALint extends StatelessWidget {
  QALint({super.key});
  final AppRouter appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    if (isTablet) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PasswordVisibilityProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CheckBoxVisibilityProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: customPrimarySwatch,
          focusColor: const Color(0xff1687A7),
          primaryColor: AppColor.titleTextColor,
        ),
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
