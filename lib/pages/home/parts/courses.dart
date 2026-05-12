import 'package:flutter/material.dart';
import 'package:learningapp/components/course_card.dart';
import 'package:learningapp/models/course_model.dart';
import 'package:provider/provider.dart';

class CoursesPart extends StatelessWidget {
  const CoursesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CourseModel>(
      builder: (context, courseModel, child) {
        final courses = courseModel.courses;
        if (courses.isEmpty) {
          return Center(child: CircularProgressIndicator());
        }
        if (courses.isNotEmpty) {
          return ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: CourseCard(course: courses[index]),
            ),
          );
        }
        return Center(child: Text('No Courses Found'));
      },
    );
  }
}
