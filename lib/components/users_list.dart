import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class User {
  String name;
  String description;
  String username;
  String website;
  String avatar;
  String role;
  User({
    required this.name,
    required this.description,
    required this.username,
    required this.website,
    required this.avatar,
    required this.role,
  });
}

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final dio = Dio();

    try {
      // Response response = await dio.get('http://192.168.0.107:3000/api');
      Response response = await dio.get(
        'https://larnr.com/wp-json/wp/v2/users',
      );
      print(response.data[0]['name']);

      setState(() {
        users = List.generate(
          response.data.length,
          (index) => User(
            name: response.data[index]['name'] ?? '',
            description: response.data[index]['description'] ?? '',
            username: response.data[index]['slug'] ?? '',
            website: response.data[index]['website'] ?? '',
            avatar:
                response.data[index]['avatar_urls']['96'] ??
                'https://img.freepik.com/free-photo/portrait-white-man-isolated_53876-40306.jpg?semt=ais_rp_progressive&w=740&q=80',
            role: response.data[index]['roles'][0] ?? '',
          ),
        );
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
        onTap: () {},
      ),
    );
  }
}
