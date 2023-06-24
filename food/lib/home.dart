import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.cyan,
                  child: const Text('One'),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.amberAccent,
                  child: const Text('Two'),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  color: Colors.pinkAccent,
                  child: const Text('Three'),
                ),
              )
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        tooltip: "Add",
        backgroundColor: Colors.green[400],
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
