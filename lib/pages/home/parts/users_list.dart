import 'package:flutter/material.dart';
import 'package:learningapp/classes/user.dart';
import 'package:learningapp/models/user_model.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class UsersList extends StatelessWidget {
  UsersList({super.key});

  List<User> users = [];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserModel>(
      builder: (context, res, child) {
        users = res.users;
        if (users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(users[index].avatar),
            ),
            title: Row(
              children: [
                Text(
                  users[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  users[index].username,
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Spacer(),
                Text(
                  users[index].role,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: const Color.fromARGB(255, 4, 28, 246),
                  ),
                ),
              ],
            ),
            subtitle: Text(users[index].description),
            onTap: () {
              print(users[index].username);

              Navigator.pushNamed(
                context,
                '/user',
                arguments: {
                  'name': users[index].name,
                  'description': users[index].description,
                  'username': users[index].username,
                  'website': users[index].website,
                  'avatar': users[index].avatar,
                  'role': users[index].role,
                },
              );
            },
          ),
        );
      },
    );
  }
}
