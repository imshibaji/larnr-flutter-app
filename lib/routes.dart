import 'package:flutter/material.dart';
import 'package:webapp/pages/about.dart';
import 'package:webapp/pages/contact.dart';
import 'package:webapp/pages/home.dart';

Map<String, Widget Function(BuildContext)> routes = {
  '/': (context) => HomePage(),
  '/about': (context) => AboutPage(),
  '/contact': (context) => ContactPage(),
};
