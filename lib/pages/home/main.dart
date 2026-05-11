import 'package:flutter/material.dart';
import 'package:learningapp/pages/home/parts/enquiries.dart';
import 'package:learningapp/pages/home/parts/centers.dart';
import 'package:learningapp/pages/home/parts/courses.dart';
import 'package:learningapp/pages/home/parts/users.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text(
                'LarnrApp',
                style: TextStyle(
                  color: const Color.fromARGB(255, 92, 3, 201),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                ' | Mentor',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.payment_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
            PopupMenuButton<String>(
              onSelected: (value) => print(value),
              itemBuilder: (context) => [
                PopupMenuItem(value: 'settings', child: Text('Settings')),
                PopupMenuItem(value: 'logout', child: Text('Logout')),
              ],
            ),
          ],
        ),
        body: TabBarView(
          children: [
            UserListPart(),
            CoursesPart(),
            CentersPart(),
            EnquiriesPart(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: 'Users', icon: Icon(Icons.people)),
            Tab(text: 'Courses', icon: Icon(Icons.bookmarks_sharp)),
            Tab(text: 'Centers', icon: Icon(Icons.hub_outlined)),
            Tab(text: 'Enquiries', icon: Icon(Icons.message_outlined)),
          ],
        ),
      ),
    );
  }
}
