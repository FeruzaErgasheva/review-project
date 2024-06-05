import 'package:json_annotation/json_annotation.dart';

part 'course_model.g.dart';
@JsonSerializable()
class CourseModel {
  String id;
  String title;
  String description;
  String imageUrl;
  List<String>? lessons;
  double price;

  CourseModel({
    required this.description,
    required this.id,
    required this.imageUrl,
    this.lessons=const [],
    required this.price,
    required this.title,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json){
    return _$CourseModelFromJson(json);
  }

  
}
