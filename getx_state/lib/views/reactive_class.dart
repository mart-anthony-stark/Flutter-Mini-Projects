import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/classes/student.dart';

// ignore: must_be_immutable
class ReactiveClass extends StatelessWidget {
  ReactiveClass({super.key});
  // var student = Student();

  // Entire class is observable
  var student = Student(name: "Anthony", age: 21).obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reactive Class')),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text('Name: ${student.value.name} ${student.value.age}')),
          ElevatedButton(
              onPressed: () {
                // Individual variables are observable
                // student.name.value = student.name.value.toUpperCase();

                // Entire class is observable
                student.update((student) {
                  student?.name = student.name.toString().toUpperCase();
                  student?.age++;
                });
              },
              child: const Text("Upper"))
        ],
      )),
    );
  }
}
