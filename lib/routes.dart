import 'package:flutter/material.dart';
import 'package:learningapp/pages/about.dart';
import 'package:learningapp/pages/contact.dart';
import 'package:learningapp/pages/home/main.dart';
import 'package:learningapp/pages/user.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => HomePage(),
  '/about': (context) => AboutPage(),
  '/contact': (context) => ContactPage(),
  '/user': (context) => UserPage(),
};
