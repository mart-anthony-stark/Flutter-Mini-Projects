import 'package:flutter/material.dart';
import 'package:bloc_pattern/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.e});
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Details")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(e.avatar),
              maxRadius: 60,
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              '${e.firstname} ${e.lastname}',
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              e.email,
              style: const TextStyle(fontSize: 25),
            ),
          ]),
        ),
      ),
    );
  }
}
