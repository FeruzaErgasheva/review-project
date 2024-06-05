// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CourseModel _$CourseModelFromJson(Map<String, dynamic> json) => CourseModel(
      description: json['description'] as String,
      id: json['id'] as String,
      imageUrl: json['imageUrl'] as String,
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      price: (json['price'] as num).toDouble(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$CourseModelToJson(CourseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'lessons': instance.lessons,
      'price': instance.price,
    };
