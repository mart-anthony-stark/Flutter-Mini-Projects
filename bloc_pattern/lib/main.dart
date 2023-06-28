import 'package:bloc_pattern/repos/repositories.dart';
import 'package:bloc_pattern/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: RepositoryProvider(
      create: (context) => UserRepository(),
      child: const Home(),
    ));
  }
}
