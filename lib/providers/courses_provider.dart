import 'package:flutter/material.dart';
import 'package:lesson_50_review/controllers/courses_controller.dart';

class CoursesProvider extends InheritedWidget {
  final CoursesController coursesController;
  const CoursesProvider(
      {super.key, required super.child, required this.coursesController});

  @override
  bool updateShouldNotify(covariant CoursesProvider oldWidget) {
    return oldWidget.coursesController != coursesController;
  }

  static CoursesController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CoursesProvider>()!
        .coursesController;
  }
}