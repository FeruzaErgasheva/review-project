import 'package:flutter/material.dart';
import 'package:lesson_50_review/providers/courses_provider.dart';
import 'package:lesson_50_review/views/widgets/add_course_dialog.dart';
import 'package:lesson_50_review/views/widgets/course_card.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  //when course card tapped
 

  // void addProduct() async {
  //   final data = await showDialog(
  //     context: context,
  //     builder: (context) => const AddCourseDialog(),
  //   );
  //   if (data != null) {
  //     try {
  //       // ignore: use_build_context_synchronously
  //       CoursesProvider.of(context).addCourse(
  //           imageUrl: data['imageUrl'],
  //           title: data['title'],
  //           description: data['description'],
  //           price: data['price']);
  //     } catch (e) {
  //       print(e);
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    print("build");
    return ListenableBuilder(
      listenable: CoursesProvider.of(context),
      builder: (context, child) {
        return Builder(builder: (context) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () async {
                      final data = await showDialog(
                        context: context,
                        builder: (context) => const AddCourseDialog(),
                      );
                      if (data != null) {
                        try {
                          // ignore: use_build_context_synchronously
                          CoursesProvider.of(context).addCourse(
                              imageUrl: data['imageUrl'],
                              title: data['title'],
                              description: data['description'],
                              price: data['price']);
                        } catch (e) {
                          print(e);
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ))
              ],
              backgroundColor: Colors.amber,
              centerTitle: true,
              title: const Text("Courses"),
            ),
            body: FutureBuilder(
                future: CoursesProvider.of(context).courses,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Text("Kusrlar mavjud emas, iltimos qo'shing"),
                    );
                  }

                  final courses = snapshot.data;
                  return courses == null || courses.isEmpty
                      ? const Center(
                          child: Text("Kurslar mavjud emas, iltimos qo'shing"),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: GridView.builder(
                            itemCount: courses.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 0.8,
                                    crossAxisSpacing: 10,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return CourseCard(
                                course: courses[index],
                                onCardTapped: () {
                                  Navigator.pushNamed(context, '/lessons',arguments: courses[index].id);
                                },
                              );
                            },
                          ));
                }),
          );
        });
      },
    );
  }
}
