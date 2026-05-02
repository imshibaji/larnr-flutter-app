import 'package:flutter/material.dart';
import 'package:learningapp/pages/home/parts/calls.dart';
import 'package:learningapp/pages/home/parts/communities.dart';
import 'package:learningapp/pages/home/parts/updates.dart';
import 'package:learningapp/pages/home/parts/users.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'LarnrApp',
            style: TextStyle(
              color: const Color.fromARGB(255, 92, 3, 201),
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.payment_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
          ],
        ),
        body: TabBarView(
          children: [
            UserListPart(),
            UpdatesPart(),
            CommunitiesPart(),
            CallsPart(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(text: 'Chats', icon: Icon(Icons.chat)),
            Tab(text: 'Updates', icon: Icon(Icons.chat_sharp)),
            Tab(text: 'Communities', icon: Icon(Icons.groups)),
            Tab(text: 'Calls', icon: Icon(Icons.call)),
          ],
        ),
      ),
    );
  }
}
