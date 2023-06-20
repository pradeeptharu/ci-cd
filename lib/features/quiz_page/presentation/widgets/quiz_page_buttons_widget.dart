import 'package:qa_lint/core/utils/constants/exports.dart';
class QuizPageButtonsWidget extends StatefulWidget {
  const QuizPageButtonsWidget({super.key});

  @override
  State<QuizPageButtonsWidget> createState() => _QuizPageButtonsWidgetState();
}

class _QuizPageButtonsWidgetState extends State<QuizPageButtonsWidget> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    double itemOffset = index * (mediaQuerryHeight(context) * 0.05 + 30);
    double scrollOffset = itemOffset - mediaQuerryWidth(context) * 0.2;
    _scrollController.animateTo(scrollOffset,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    final quizProvider = Provider.of<QuizProvider>(context);
    final currentQuestionIndex = quizProvider.currentQuestionIndex;
    if (currentQuestionIndex == 0) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: _nextButton(),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            SizedBox(
              width: mediaQuerryWidth(context) * 0.1,
            ),
            _previousButton(),
            SizedBox(
              width: mediaQuerryWidth(context) * 0.3,
            ),
            _nextButton(),
          ],
        ),
      );
    }
  }

  _nextButton() {
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    var quizLength = quizProvider.quizQuestions.length;
    bool isLastQuestion = false;
    if (currentQuestionIndex == quizLength - 1) {
      isLastQuestion = true;
    }

    return SizedBox(
      width: mediaQuerryWidth(context) * 0.25,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.buttonColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (isLastQuestion) {
            //display score
            showDialog(context: context, builder: (_) => _showScoreDialog());
          } else {
            //next question
            quizProvider.submitAnswer();
            _scrollToIndex(currentQuestionIndex);
          }
        },
        child: Text(isLastQuestion ? "Finish" : "Next"),
      ),
    );
  }

  _previousButton() {
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    return SizedBox(
      width: mediaQuerryWidth(context) * 0.25,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: AppColor.buttonColor,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          //previous question
          quizProvider.unsubmitAnswer();
          _scrollToIndex(currentQuestionIndex);
        },
        child: const Text("Previous"),
      ),
    );
  }

  _showScoreDialog() {
    final quizProvider = Provider.of<QuizProvider>(context);
    var currentQuestionIndex = quizProvider.currentQuestionIndex;
    var quizLength = quizProvider.quizQuestions.length;
    var quizScore = quizProvider.score;
    bool isPassed = false;

    if (quizScore >= quizLength * 0.8) {
      //pass if 80 %
      isPassed = true;
    }
    String title = isPassed ? "Passed " : "Failed";

    return AlertDialog(
      title: Text(
        "$title | Score is $quizScore",
        style: TextStyle(color: isPassed ? Colors.green : Colors.redAccent),
      ),
      content: ElevatedButton(
        child: const Text("Restart"),
        onPressed: () {
          Navigator.pop(context);
          quizProvider.resetQuiz();
          _scrollToIndex(currentQuestionIndex);
        },
      ),
    );
  }
}
