import 'package:flutter/material.dart';
import 'package:lesson_50_review/controllers/lessons_controller.dart';

class LessonsProvider extends InheritedWidget {
  final LessonsController lessonsController;
  const LessonsProvider(
      {super.key, required super.child, required this.lessonsController});

  @override
  bool updateShouldNotify(covariant LessonsProvider oldWidget) {
    return oldWidget.lessonsController != lessonsController;
  }

  static LessonsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<LessonsProvider>()!
        .lessonsController;
  }
}