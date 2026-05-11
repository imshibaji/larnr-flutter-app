import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('User Details: ${args['id']}')),
      body: SizedBox(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(args['avatar']),
              radius: 50,
            ),
            Text(
              args['name'],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            usernameRole(args['username'], args['role']),
            websiteUrl(args['website']),
            SizedBox(height: 10),
            Divider(indent: 100, endIndent: 100),
            Text('${args['description']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget websiteUrl(String url) {
    return url != ''
        ? Text(url, style: TextStyle(fontWeight: FontWeight.w500))
        : SizedBox();
  }

  Row usernameRole(String username, String role) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          username,
          style: TextStyle(color: const Color.fromARGB(255, 4, 17, 155)),
        ),
        Text(' | '),
        Text(
          role,
          style: TextStyle(color: const Color.fromARGB(255, 4, 155, 9)),
        ),
      ],
    );
  }
}
