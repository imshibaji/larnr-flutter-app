import 'package:flutter/material.dart';
import 'package:learningapp/components/app_badge.dart';
import 'package:learningapp/components/users_list.dart';

class UserListPage extends StatelessWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(),
        SizedBox(height: 20),
        SizedBox(
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            children: [
              AppBadge(
                title: 'All',
                backgroundColor: const Color.fromARGB(255, 198, 255, 200),
              ),
              AppBadge(title: 'Online', count: 5),
              AppBadge(title: 'Active', count: 10),
              AppBadge(title: 'Inactive', count: 2),
              AppBadge(title: '+'),
            ],
          ),
        ),
        Expanded(child: UsersList()),
      ],
    );
  }

  Container searchBar() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(5.0),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        color: Colors.black12,
      ),
      child: const Center(
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'Search for users',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
