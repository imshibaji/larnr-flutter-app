import 'package:flutter/material.dart';
import 'package:learningapp/components/users_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            Text('All Users List', style: TextStyle(fontSize: 20)),
            Expanded(child: UsersList()),
          ],
        ),
      ),
    );
  }
}
