import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/controllers/counter_controller.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // int _num = 0;
  // var count = 0.obs;

  // If init is not used in GetX<Type>
  CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetX<CounterController>(
              // init: CounterController(),
              builder: (controller) {
                return Text("Value ${controller.count}");
              },
            ),
            ElevatedButton(
                onPressed: () {
                  // Get.find<CounterController>().increment();

                  // If init not used in GetX
                  counterController.increment();
                },
                child: const Text("Increment"))
          ],
        ),
      ),
    );
  }
}
