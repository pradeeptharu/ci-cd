import 'package:flutter/material.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/features/quiz_page/presentation/widgets/quiz_page_answer_widget.dart';
import 'package:qa_lint/features/quiz_page/presentation/widgets/quiz_page_buttons_widget.dart';
import 'package:qa_lint/features/quiz_page/presentation/widgets/quiz_page_index_widget.dart';
import 'package:qa_lint/features/quiz_page/presentation/widgets/quiz_page_question_widget.dart';
import 'package:qa_lint/features/quiz_page/presentation/widgets/quiz_page_timer_widget.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isTablet() {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: mediaQuerryHeight(context) * 0.01,
            ),
            Row(
              children: [
                SizedBox(width: mediaQuerryWidth(context) * 0.01),
                SizedBox(
                  height: isTablet()
                      ? mediaQuerryHeight(context) * 0.5
                      : mediaQuerryHeight(context) * 0.15,
                  width: mediaQuerryHeight(context) * 0.2,
                  child: Image.asset(
                    ImagePath.logoQaLint,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            
            const QuizPageTimerWidget(),
            const QuizPageIndexWidget(),
            const QuizPageQuestionWidget(),
            const QuizPageAnswerWidget(),
            const QuizPageButtonsWidget(),
          ],
        ),
      ),
    );
  }
}
