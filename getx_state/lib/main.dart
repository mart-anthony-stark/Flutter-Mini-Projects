import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/views/home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(title: "SnackBar", home: const Home());
  }
}
