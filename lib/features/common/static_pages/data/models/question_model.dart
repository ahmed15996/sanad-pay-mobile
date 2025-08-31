import 'package:json_annotation/json_annotation.dart';

part 'question_model.g.dart';

@JsonSerializable(createToJson: false)
class QuestionModel {
  final int id;

  final String question, answer;

  QuestionModel({
    required this.id,
    required this.question,
    required this.answer,
  });

  factory QuestionModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionModelFromJson(json);
}
