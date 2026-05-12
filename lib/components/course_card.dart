import 'package:flutter/material.dart';
import 'package:learningapp/classes/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({super.key, required this.course});

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.network(course.image!),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  course.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text('Batch Size: ' + course.batchSize!),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Text(course.description!),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Duration: ' + course.duration!),
              Text('Mode: ' + course.mode!),
              Text('Price: ' + course.price!),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(course.author!.avatar),
                ),
                SizedBox(width: 10),
                Text(
                  course.author!.name,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/course',
                      arguments: {'course': course},
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
