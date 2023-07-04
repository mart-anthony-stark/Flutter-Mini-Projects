import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // int _num = 0;
  var count = 0.obs;

  void increment() {
    // setState(() {
    //   _num++;
    // });
    count++;
    print(count);
  }

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
            Obx(() => Text("Counter: $count")),
            ElevatedButton(
                onPressed: () => increment(), child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}
