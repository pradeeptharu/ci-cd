import 'package:qa_lint/core/utils/constants/exports.dart';

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
        ChangeNotifierProvider(
          create: (context) => SignUpUserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginUserDataProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => QuizProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectionStates(),
        ),
        ChangeNotifierProvider(
          create: (context) => DialogProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => InternetConnectionProvider(),
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
