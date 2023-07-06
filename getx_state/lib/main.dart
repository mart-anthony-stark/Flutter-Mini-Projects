import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/services/all_controller_binding.dart';
import 'package:getx_state/services/service.dart';
import 'package:getx_state/views/counter.dart';
import 'package:getx_state/views/counter2.dart';
import 'package:getx_state/views/home.dart';
import 'package:getx_state/views/reactive_class.dart';
import 'package:getx_state/views/screen2.dart';
import 'package:getx_state/views/service_screen.dart';

Future<void> main() async {
  await initServices();
  runApp(const MainApp());
}

Future<void> initServices() async {
  print("Starting services...");
  await Get.putAsync<Service>(() async => Service());
  print("Services started");
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AllControllerBinding(),
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
        GetPage(name: "/counter2", page: () => const Counter2()),
        GetPage(name: "/reactive-class", page: () => ReactiveClass()),
        GetPage(name: '/services', page: () => const ServiceScreen())
      ],
    );
  }
}
