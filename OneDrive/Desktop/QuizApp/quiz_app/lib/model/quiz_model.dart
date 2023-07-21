class QuizModel {
  final String name;
  final List<QuizOptionModel> options;

  QuizModel(this.name, this.options);

  factory QuizModel.fromJson(Map<String, dynamic> json) {
    return QuizModel(
      json['name'],
      (json['options'] as List<dynamic>)
          .map((option) => QuizOptionModel.fromJson(option))
          .toList(),
    );
  }
}

class QuizOptionModel {
  final String questionId;
  final String name;

  QuizOptionModel(this.questionId, this.name);

  factory QuizOptionModel.fromJson(Map<String, dynamic> json) {
    return QuizOptionModel(json['questionId'], json['name']);
  }
}
