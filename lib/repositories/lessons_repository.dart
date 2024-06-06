import 'package:lesson_50_review/models/lesson_model.dart';
import 'package:lesson_50_review/services/lessons_http_services.dart';

class LessonsRepository{
  
  final LessonsHttpServices lessonsHttpServices=LessonsHttpServices();
    Future<List<LessonModel>> getLessons(String id) async {
    return lessonsHttpServices.getLessonsById(id);
  }
}