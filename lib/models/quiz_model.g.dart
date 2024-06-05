// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quiz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuizModel _$QuizModelFromJson(Map<String, dynamic> json) => QuizModel(
      answer: (json['answer'] as num).toInt(),
      id: json['id'] as String,
      lesson_id: json['lesson_id'] as String,
      options:
          (json['options'] as List<dynamic>).map((e) => e as String).toList(),
      question: json['question'] as String,
    );

Map<String, dynamic> _$QuizModelToJson(QuizModel instance) => <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'lesson_id': instance.lesson_id,
      'options': instance.options,
      'answer': instance.answer,
    };
