import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../model/quiz_model.dart';

class QuizService {
  final Dio _dio = Dio();
  final String apiLink = 'https://api-qalint.apps.vurilo.com/api/quiz';

  Future<List<QuizModel>> fetchQuizData() async {
    try {
      final response = await _dio.get(apiLink);
      if (response.statusCode == 200) {
        print('Data Is Loading');
        final List<dynamic> data = response.data;
        return data.map((json) => QuizModel.fromJson(json)).toList();
      }
    } catch (error) {
      print('Error fetching quiz data: $error');
    }
    return [];
  }
}

class QuizProvider extends ChangeNotifier {
  final QuizService _quizService = QuizService();
  List<QuizModel> _quizData = [];

  List<QuizModel> get quizData => _quizData;

  Future<void> fetchQuizData() async {
    final List<QuizModel> quizData = await _quizService.fetchQuizData();
    _quizData = quizData;
    notifyListeners();
  }
}
