import 'package:lesson_50_review/models/course_model.dart';
import 'package:lesson_50_review/services/courses_http_services.dart';

class CoursesRepository {
  final CoursesHttpServices coursesHttpServices = CoursesHttpServices();

  Future<List<CourseModel>> getCourses() async {
    return coursesHttpServices.getCourses();
  }

  Future<CourseModel> addCourse(
      {required String imageUrl,
      required title,
      required String description,
      required double price}) async {
    final newCourse = await coursesHttpServices.addCourse(
        imageUrl: imageUrl,
        title: title,
        description: description,
        price: price);
    return newCourse;
  }
}
