import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/views/counter.dart';
import 'package:getx_state/views/home.dart';
import 'package:getx_state/views/reactive_class.dart';
import 'package:getx_state/views/screen2.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "SnackBar",
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const Home()),
        GetPage(
          name: "/screen2",
          page: () => const Screen2(),
        ),
        GetPage(name: "/screen2/:id", page: () => const Screen2()),
        GetPage(name: "/counter", page: () => const Counter()),
        GetPage(name: "/reactive-class", page: () => ReactiveClass()),
      ],
    );
  }
}
