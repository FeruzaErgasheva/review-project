import "dart:convert";

import "package:http/http.dart" as http;
import "package:lesson_50_review/models/course_model.dart";

class CoursesHttpServices {
  //get courses
  Future<List<CourseModel>> getCourses() async {
    List<CourseModel> loadedCourses = [];
    Uri url =
        Uri.parse("https://lesson-50-default-rtdb.firebaseio.com/courses.json");
    try {
      final response = await http.get(url);
      Map data = jsonDecode(response.body);
      if (data != null) {
        data.forEach((key, value) {
          // print(value);
          value["id"] = key;
          loadedCourses.add(CourseModel.fromJson(value));
          // print(loadedCourses.length);
        });
      }
      return loadedCourses;
    } catch (e) {
      // print(e);
      return [];
    }
  }

  ///add course
  Future<CourseModel> addCourse(
      {required String imageUrl,
      required title,
      required String description,
      required double price}) async {
    Uri url =
        Uri.parse("https://lesson-50-default-rtdb.firebaseio.com/courses.json");
    Map<String, dynamic> courseData = {
      "imageUrl": imageUrl,
      "title": title,
      "description": description,
      "price": price,
      "lessons":[]
    };
    final response = await http.post(
      url,
      body: jsonEncode(courseData),
    );
    final data = jsonDecode(response.body);//here data is the id of new course
    courseData['id'] = data['name'];
    CourseModel newCourse = CourseModel.fromJson(courseData);
    return newCourse;
  }
}

void main(List<String> args) {
  CoursesHttpServices coursesHttpServices = CoursesHttpServices();
  // coursesHttpServices.getCourses();
  coursesHttpServices.addCourse(imageUrl: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR92b5NgXUfRkPbQkFIeF2R68Y0lT_l2r5Xdw&s", title: "Calculus", description: "This is the introduction for Calculus", price: 150);
}
