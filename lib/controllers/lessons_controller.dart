import 'package:flutter/material.dart';
import 'package:lesson_50_review/models/lesson_model.dart';
import 'package:lesson_50_review/repositories/lessons_repository.dart';

class LessonsController with ChangeNotifier{
  final LessonsRepository lessonsRepository = LessonsRepository();
  List<LessonModel> _sortedLessons = [];

  Future<List<LessonModel>> sortedLessons(String id) async {
    _sortedLessons = await lessonsRepository.getLessons(id);
    print(_sortedLessons.length);
    return [..._sortedLessons];
  }
}

void main(List<String> args) {
  LessonsController lessonsController = LessonsController();
  lessonsController.sortedLessons("ielts");
}
