import 'dart:convert';

import 'package:lesson_50_review/models/lesson_model.dart';
import 'package:http/http.dart' as http;

class LessonsHttpServices {

  Future<List<LessonModel>> getLessonsById(String id) async {
    List<LessonModel> sortedLessons = [];
    Uri url = Uri.parse(
        'https://lesson-50-default-rtdb.firebaseio.com/lessons.json?orderBy="course_id"&equalTo="ielts"');
    try {
     final response = await http.get(url);
    final data = jsonDecode(response.body);
      if (data != null) {
        data.forEach((key, value) {
          value["id"] = key;
          sortedLessons.add(LessonModel.fromJson(value));
        });
      }
      return sortedLessons;
    } catch (e) {
      // print(e);
      return [];
    }
  }


}

void main(List<String> args) {
  LessonsHttpServices lessonsHttpServices = LessonsHttpServices();
  lessonsHttpServices.getLessonsById("ielts");
}
