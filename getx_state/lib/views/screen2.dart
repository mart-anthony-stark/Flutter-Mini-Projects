import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Screen 2"), centerTitle: true),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Get.back(result: "as");
              },
              child: const Text('Go Back')),
          Text('${Get.arguments?["name"]}'),
          Text('${Get.parameters["id"]}'),
        ],
      )),
    );
  }
}
