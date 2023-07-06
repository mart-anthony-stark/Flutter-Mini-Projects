import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/services/service.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Get.find<Service>().incrementCounter();
              },
              child: const Text("Increment"))
        ],
      )),
    );
  }
}
