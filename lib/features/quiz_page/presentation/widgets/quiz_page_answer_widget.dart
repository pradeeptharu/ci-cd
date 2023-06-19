import 'package:flutter/material.dart';
import 'package:qa_lint/features/quiz_page/data/models/quiz_model.dart';
import 'package:qa_lint/core/utils/constants/constants.dart';
import 'package:qa_lint/features/quiz_page/presentation/providers/quiz_provider.dart';
import 'package:provider/provider.dart';

class QuizPageAnswerWidget extends StatefulWidget {
  const QuizPageAnswerWidget({super.key});

  @override
  State<QuizPageAnswerWidget> createState() => _QuizPageAnswerWidgetState();
}

class _QuizPageAnswerWidgetState extends State<QuizPageAnswerWidget> {
  List<Question> quizQuestions = getQuestions();
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final currentQuestionIndex = quizProvider.currentQuestionIndex;
    return SizedBox(
      height: mediaQuerryHeight(context) * 0.43,
      width: mediaQuerryWidth(context) * 0.8,
      child: SingleChildScrollView(
        child: Column(
          children: quizQuestions[currentQuestionIndex]
              .answersList
              .map(
                (e) => _answerButton(e),
              )
              .toList(),
        ),
      ),
    );
  }

  Widget _answerButton(Answer answer) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final selectedAnswer = quizProvider.selectedAnswer;
    bool isSelected = selectedAnswer == answer;

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 8),
      height: 48,
      child: TextButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: isSelected ? Colors.white : Colors.black,
          backgroundColor: isSelected ? AppColor.buttonColor : Colors.white,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          quizProvider.setselectedAnswer(answer);
        },
        child: Text(answer.answerText),
      ),
    );
  }
}
