import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? title, message;
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
        'https://larnr.com/wp-json/wp/v2/pages/18',
      );
      print(response.data);

      setState(() {
        title = response.data['title']["rendered"];
        message = response.data['content']["rendered"];
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Column(
          children: [
            Text('Title: $title', style: TextStyle(fontSize: 20)),
            Expanded(
              child: SingleChildScrollView(child: Html(data: (message ?? ''))),
            ),
          ],
        ),
      ),
    );
  }
}
