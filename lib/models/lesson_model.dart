import 'package:json_annotation/json_annotation.dart';

part 'lesson_model.g.dart';

@JsonSerializable()
class LessonModel {
  String id;
  String course_id;
  String title;
  String description;
  String videoUrl;
  List<String?> quizzes;

  LessonModel({
    required this.course_id,
    required this.description,
    required this.id,
    this.quizzes=const [],
    required this.title,
    required this.videoUrl,
  });

  factory LessonModel.fromJson(Map<String,dynamic> json){
    return _$LessonModelFromJson(json);
  }

}
