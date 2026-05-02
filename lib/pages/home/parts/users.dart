import 'package:flutter/material.dart';
import 'package:learningapp/components/app_badge.dart';
import 'package:learningapp/pages/home/parts/users_list.dart';
import 'package:learningapp/models/user_model.dart';
import 'package:provider/provider.dart';

class UserListPart extends StatelessWidget {
  const UserListPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        searchBar(context),
        SizedBox(height: 20),
        SizedBox(
          height: 45,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(8.0),
            children: [
              AppBadge(
                title: 'All',
                backgroundColor: const Color.fromARGB(255, 241, 231, 255),
                onTap: () =>
                    Provider.of<UserModel>(context, listen: false).loadData(),
              ),
              AppBadge(
                title: 'Mentors',
                count: Provider.of<UserModel>(context).mentors.length,
                onTap: () => Provider.of<UserModel>(
                  context,
                  listen: false,
                ).filter('mentor'),
              ),
              AppBadge(
                title: 'Students',
                count: Provider.of<UserModel>(context).students.length,
                onTap: () => Provider.of<UserModel>(
                  context,
                  listen: false,
                ).filter('student'),
              ),
            ],
          ),
        ),
        Expanded(child: UsersList()),
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
            hintText: 'Search for users',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            prefixIcon: Icon(Icons.search),
          ),
          onChanged: (String value) =>
              Provider.of<UserModel>(context, listen: false).search(value),
        ),
      ),
    );
  }
}
