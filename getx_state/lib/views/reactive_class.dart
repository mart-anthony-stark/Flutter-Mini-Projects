import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/controllers/my_controller.dart';

// ignore: must_be_immutable
class ReactiveClass extends StatelessWidget {
  ReactiveClass({super.key});

// Inject Student Controller
  MyController myController = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reactive Class')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(
              'Name: ${myController.student.value.name} ${myController.student.value.age}')),
          ElevatedButton(
              onPressed: () {
                myController.convertToUpperCase();
              },
              child: const Text("Upper"))
        ],
      )),
    );
  }
}
