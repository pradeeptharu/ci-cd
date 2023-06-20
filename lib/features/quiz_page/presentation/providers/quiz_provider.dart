import 'package:qa_lint/core/utils/constants/exports.dart';

class QuizProvider extends ChangeNotifier {
  List<Question> quizQuestions = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  // int _totalSeconds = 10;
  // Timer? _timer;

  // int get totalSeconds => _totalSeconds;

  Answer? selectedAnswer;

  void setCurrentQuestionIndex(int index) {
    currentQuestionIndex = index;
    notifyListeners();
  }

  void setselectedAnswer(Answer answer) {
    selectedAnswer = answer;
    notifyListeners();
  }

  void submitAnswer() {
    // Check if the selected answer is correct and update the score
    if (selectedAnswer?.isCorrect == true) {
      score++;
    }

    // Move to the next question
    currentQuestionIndex++;

    // Reset the selected answer
    selectedAnswer = null;

    // Notify listeners about the state changes
    notifyListeners();
  }

  // void startTimer() {
  //   const oneSec = Duration(seconds: 1);
  //   _timer = Timer.periodic(oneSec, (timer) {
  //     if (_totalSeconds < 1) {
  //       timer.cancel();
  //     } else {
  //       _totalSeconds--;
  //       notifyListeners();
  //     }
  //   });
  // }

  // void resetTimer() {
  //   startTimer();
  //   _totalSeconds = 10;
  //   _timer?.cancel();
  //   notifyListeners();
  // }

  void unsubmitAnswer() {
    // Check if the selected answer is correct and update the score
    if (selectedAnswer?.isCorrect == true) {
      score--;
    }

    // Move to the next question
    currentQuestionIndex--;

    // Reset the selected answer
    selectedAnswer = null;

    // Notify listeners about the state changes
    notifyListeners();
  }

  void resetQuiz() {
    currentQuestionIndex = 0;
    score = 0;
    selectedAnswer = null;
    notifyListeners();
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   super.dispose();
  // }
}
