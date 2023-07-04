import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
          child: Column(
        children: [
          Text("Counter: $_num"),
          TextButton(
              onPressed: () {
                setState(() {
                  _num++;
                });
              },
              child: const Text('Increment'))
        ],
      )),
    );
  }
}
