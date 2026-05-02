import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:learningapp/classes/user.dart';
import 'package:dio/dio.dart';

class UserModel extends ChangeNotifier {
  List<User> _users = [];
  List<User> _filteredUsers = [];

  UnmodifiableListView<User> get users => UnmodifiableListView(_filteredUsers);

  UnmodifiableListView<User> get mentors {
    return UnmodifiableListView(_users.where((user) => user.role == 'mentor'));
  }

  UnmodifiableListView<User> get students {
    return UnmodifiableListView(_users.where((user) => user.role == 'student'));
  }

  UserModel() {
    loadData();
  }

  void search(String query) {
    if (query.isEmpty) _filteredUsers = _users;
    _filteredUsers = _users
        .where(
          (user) =>
              user.name.toLowerCase().contains(query.toLowerCase()) ||
              user.username.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
    notifyListeners();
  }

  void filter(String role) {
    if (role.isEmpty) _filteredUsers = _users;
    _filteredUsers = _users.where((user) => user.role == role).toList();
    notifyListeners();
  }

  void loadData() async {
    final dio = Dio();

    try {
      // Response response = await dio.get('http://192.168.0.107:3000/api');
      Response response = await dio.get(
        'https://larnr.com/wp-json/wp/v2/users',
      );
      print(response.data.length);
      _users = List.generate(
        response.data.length,
        (index) => User(
          id: response.data[index]['id'] as int,
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
      _filteredUsers = _users;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
