import 'package:flutter/material.dart';
import 'package:lesson_50_review/models/course_model.dart';
import 'package:lesson_50_review/repositories/courses_repositor.dart';

class CoursesController with ChangeNotifier {
  final CoursesRepository coursesRepository = CoursesRepository();

  List<CourseModel> _courses = [];

  Future<List<CourseModel>> get courses async {
    _courses = await coursesRepository.getCourses();
    return [..._courses];
  }

  void addCourse(
      {required String imageUrl,
      required title,
      required String description,
      required double price}) async {
    final newCourse = await coursesRepository.addCourse(
        imageUrl: imageUrl,
        title: title,
        description: description,
        price: price);
    _courses.add(newCourse);
    notifyListeners();
  }
}
