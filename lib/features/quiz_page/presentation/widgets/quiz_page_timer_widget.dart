import 'package:qa_lint/core/utils/constants/exports.dart';

class QuizPageTimerWidget extends StatefulWidget {
  const QuizPageTimerWidget({super.key});

  @override
  State<QuizPageTimerWidget> createState() => _QuizPageTimerWidgetState();
}

class _QuizPageTimerWidgetState extends State<QuizPageTimerWidget> {
  int _totalSeconds = 1800;
  late Timer _timer;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_totalSeconds < 1) {
          timer.cancel();
          showDialog(context: context, builder: (_) => _showScoreDialog());
        } else {
          _totalSeconds--;
        }
      });
    });
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizProvider>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.timer_outlined),
                  customText(
                      text: _formatTime(_totalSeconds), context: context),
                  // if (_totalSeconds < 1) _showScoreDialog(),
                ],
              ),
            ));
  }

  _showScoreDialog() {
    final quizProvider = Provider.of<QuizProvider>(context);
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
          // quizProvider.resetTimer();
          // quizProvider.startTimer(); // Start the timer again
        },
      ),
    );
  }
}
