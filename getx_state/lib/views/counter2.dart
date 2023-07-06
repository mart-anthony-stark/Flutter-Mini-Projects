import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/controllers/counter2_controller.dart';
import 'package:getx_state/controllers/counter_controller.dart';

class Counter2 extends StatefulWidget {
  const Counter2({super.key});

  @override
  State<Counter2> createState() => _CounterState();
}

class _CounterState extends State<Counter2> {
  Counter2Controller counter2controller = Get.put(Counter2Controller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<Counter2Controller>(
              id: 'txtCount',
              builder: (controller) {
                return Text("Value txtCount: ${controller.count}");
              },
            ),
            GetBuilder<Counter2Controller>(
              id: "count2",
              builder: (controller) {
                return Text("Value txtCount: ${controller.count}");
              },
            ),
            Obx(() =>
                Text('The value is ${Get.find<CounterController>().count()}')),
            // GetX<Counter2Controller>(
            //   init: Counter2Controller(),
            //   // initState: (state) => counter2controller.increment(),
            //   // dispose: (_) => counter2controller.cleanupTask(),
            //   builder: (controller) {
            //     return Text("Value: ${controller.count}");
            //   },
            // ),
            ElevatedButton(
                onPressed: () {
                  Get.find<Counter2Controller>().increment();
                },
                child: const Text("Increment")),
            ElevatedButton(
                onPressed: () {
                  Get.find<CounterController>().increment();
                },
                child: const Text("Increment Bind")),
          ],
        ),
      ),
    );
  }
}
