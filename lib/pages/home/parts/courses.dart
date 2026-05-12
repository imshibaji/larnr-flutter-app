import 'package:flutter/material.dart';
import 'package:learningapp/components/app_badge.dart';
import 'package:learningapp/components/course_card.dart';
import 'package:learningapp/models/course_model.dart';
import 'package:provider/provider.dart';

class CoursesPart extends StatelessWidget {
  const CoursesPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(context),
        SizedBox(
          height: 45,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                AppBadge(
                  title: 'All Courses',
                  backgroundColor: const Color.fromARGB(255, 241, 231, 255),
                ),
                AppBadge(title: 'Software Engineering', count: 10),
                AppBadge(title: 'Data Science', count: 10),
              ],
            ),
          ),
        ),
        Expanded(child: CourseList()),
      ],
    );
  }

  Container searchBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.black12,
      ),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for Courses',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String value) =>
              Provider.of<CourseModel>(context, listen: false).search(value),
        ),
      ),
    );
  }
}

class CourseList extends StatelessWidget {
  const CourseList({super.key});

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
