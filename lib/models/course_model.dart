import 'dart:collection';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:html/parser.dart';
import 'package:learningapp/classes/course.dart';
import 'package:learningapp/classes/user.dart';

class CourseModel extends ChangeNotifier {
  List<Course> _courses = [];
  List<Course> _filteredCourses = [];

  CourseModel() {
    loadCourses();
  }

  UnmodifiableListView<Course> get courses =>
      UnmodifiableListView(_filteredCourses);

  void search(String query) {
    if (query.isEmpty) _filteredCourses = _courses;
    _filteredCourses = _courses
        .where(
          (course) =>
              course.title.toLowerCase().contains(query.toLowerCase()) ||
              course.slug.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }

  void filter(String mode) {
    if (mode.isEmpty) _filteredCourses = _courses;
    _filteredCourses = _courses.where((course) => course.mode == mode).toList();
    notifyListeners();
  }

  void loadCourses() async {
    final dio = Dio();
    try {
      final response = await dio.get(
        'https://larnr.com/wp-json/wp/v2/courses?_embed',
      );
      print(response.data.length);
      _courses = List.generate(
        response.data.length,
        (index) => Course(
          id: response.data[index]['id'] as int,
          title: response.data[index]['title']['rendered'] ?? '',
          slug: response.data[index]['slug'] ?? '',
          status: response.data[index]['status'] ?? '',
          description: parse(
            response.data[index]['excerpt']['rendered'],
          ).body!.text.trim(),
          content: response.data[index]['content']['rendered'] ?? '',
          image: response.data[index]['featured_media'] != 0
              ? response
                    .data[index]['_embedded']['wp:featuredmedia'][0]['source_url']
              : 'https://placehold.co/600x400.png?text=No%20Image',
          duration: response.data[index]['duration'] ?? '',
          mode: response.data[index]['mode'] ?? '',
          batchSize: response.data[index]['batch_size'] ?? '',
          price: response.data[index]['price'] ?? '',
          priceRanges: response.data[index]['price_ranges'] ?? '',
          author: User(
            id: response.data[index]['_embedded']['author'][0]['id'] as int,
            name: response.data[index]['_embedded']['author'][0]['name'] ?? '',
            description:
                response.data[index]['_embedded']['author'][0]['description'] ??
                '',
            username:
                response.data[index]['_embedded']['author'][0]['username'] ??
                '',
            website:
                response.data[index]['_embedded']['author'][0]['url'] ?? '',
            avatar:
                response
                    .data[index]['_embedded']['author'][0]['avatar_urls']['96'] ??
                'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_rp_progressive&w=740&q=80',
            role:
                response.data[index]['_embedded']['author'][0]['roles'][0] ??
                '',
          ),
        ),
      );
      _filteredCourses = _courses;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addCourse(Course course) {
    _courses.add(course);
    notifyListeners();
  }

  void removeCourse(Course course) {
    _courses.remove(course);
    notifyListeners();
  }
}
