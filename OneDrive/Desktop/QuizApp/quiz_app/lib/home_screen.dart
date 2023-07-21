import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/services.dart/api_services.dart';
import '../model/quiz_model.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade300,
        title: const Text('Quiz App'),
        centerTitle: true,
      ),
      body: Consumer<QuizProvider>(
        builder: (context, quizProvider, child) {
          final List<QuizModel> quizData = quizProvider.quizData;
          return ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              final quiz = quizData[index];
              return Card(
                child: ListTile(
                  title: Text(quiz.name),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: quiz.options
                        .map(
                          (option) => Card(
                            child: Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: double.infinity,
                              child: Text(option.name),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
