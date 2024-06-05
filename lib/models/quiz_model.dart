import 'package:json_annotation/json_annotation.dart';

part 'quiz_model.g.dart';

@JsonSerializable()
class QuizModel {
  String id;
  String question;
  String lesson_id;
  List<String> options;
  int answer;

  QuizModel(
      {required this.answer,
      required this.id,
      required this.lesson_id,
      required this.options,
      required this.question,
      r});
  factory QuizModel.fromJson(Map<String,dynamic> json){
    return _$QuizModelFromJson(json);
  }
}
