import 'package:flutter/material.dart';
import 'package:lesson_50_review/controllers/courses_controller.dart';
import 'package:lesson_50_review/providers/courses_provider.dart';
import 'package:lesson_50_review/views/screens/courses_screen.dart';
import 'package:lesson_50_review/views/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CoursesProvider(
        coursesController: CoursesController(),
        child: Builder(
          builder: (context) {
            return ListenableBuilder(
              listenable: CoursesProvider.of(context),
              builder: (context, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  routes: {
                    "/": (ctx) => const HomeScreen(),
                    "/courses": (ctx) => const CoursesScreen()
                  },
                );
              },
            );
          },
        ));
  }
}
