import 'package:flutter/material.dart';
import 'package:lesson_50_review/models/course_model.dart';

class CourseCard extends StatelessWidget {
  CourseModel course;
  Function()? onCardTapped;
  CourseCard({super.key, required this.course,required this.onCardTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:onCardTapped ,
      child: Card(
        
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                course.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    course.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    course.description,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "\$${course.price}",
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
    ;
  }
}
