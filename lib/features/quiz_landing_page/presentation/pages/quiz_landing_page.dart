import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_button.dart';
import 'package:qa_lint/core/utils/custom_widgets/custom_text_widget.dart';
import 'package:qa_lint/features/quiz_page/presentation/pages/quiz_page.dart';

class QuizLandingPage extends StatefulWidget {
  const QuizLandingPage({Key? key}) : super(key: key);

  @override
  State<QuizLandingPage> createState() => _QuizLandingPageState();
}

class _QuizLandingPageState extends State<QuizLandingPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: mediaQuerryHeight(context) * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0.0, 30.0),
                child: customText(
                  context: context,
                  text:
                      'You need to pass quiz to be a certified tester for this app.',
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.3,
                  color: AppColor.titleTextColor,
                  fontSize: mediaQuerryHeight(context) * 0.04,
                ),
              ),
              SizedBox(
                height: isTablet()
                    ? mediaQuerryHeight(context) * 0.05
                    : mediaQuerryHeight(context) * 0.08,
              ),
              SizedBox(
                height: isTablet()
                    ? mediaQuerryHeight(context) * 0.4
                    : mediaQuerryHeight(context) * 0.2,
                width: mediaQuerryWidth(context) * 0.52,
                child: Image.asset(
                  ImagePath.logoQaLint,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: mediaQuerryHeight(context) * 0.42,
              ),
              SizedBox(
                child: CustomButton(
                    text: 'Start Quiz',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuizPage(),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
