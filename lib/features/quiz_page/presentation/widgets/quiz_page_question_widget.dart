import 'package:qa_lint/core/utils/constants/exports.dart';

class QuizPageQuestionWidget extends StatefulWidget {
  const QuizPageQuestionWidget({super.key});

  @override
  State<QuizPageQuestionWidget> createState() => _QuizPageQuestionWidgetState();
}

class _QuizPageQuestionWidgetState extends State<QuizPageQuestionWidget> {
  List<Question> quizQuestions = getQuestions();
  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    return Expanded(
      child: PageView.builder(
        itemCount: quizQuestions.length,
        controller: PageController(initialPage: currentQuestionIndex),
        physics:
            const PageScrollPhysics(parent: NeverScrollableScrollPhysics()),
        onPageChanged: (int index) {
          quizProvider.setCurrentQuestionIndex(index);
        },
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 8, 0),
            child: SingleChildScrollView(
              child: Text(
                "${currentQuestionIndex + 1}.${quizQuestions[currentQuestionIndex].questionText}",
                style: const TextStyle(fontSize: 24),
              ),
            ),
          );
        },
      ),
    );
  }
}
