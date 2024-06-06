// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lesson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LessonModel _$LessonModelFromJson(Map<String, dynamic> json) => LessonModel(
      course_id: json['course_id'] as String,
      description: json['description'] as String,
      id: json['id'] as String,
      quizzes: (json['quizzes'] as List<dynamic>?)
              ?.map((e) => e as String?)
              .toList() ??
          const [],
      title: json['title'] as String,
      videoUrl: json['videoUrl'] as String,
    );

Map<String, dynamic> _$LessonModelToJson(LessonModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'course_id': instance.course_id,
      'title': instance.title,
      'description': instance.description,
      'videoUrl': instance.videoUrl,
      'quizzes': instance.quizzes,
    };
