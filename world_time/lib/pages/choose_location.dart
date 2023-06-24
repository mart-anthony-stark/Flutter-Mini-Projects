import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  void initState() {
    super.initState();

    print('Init state');
  }

  @override
  Widget build(BuildContext context) {
    print("build");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Choose Location'),
        centerTitle: true,
      ),
      body: ElevatedButton(
          onPressed: () {
            setState(() {
              counter += 1;
            });
          },
          child: Text('Counter - ${counter}')),
    );
  }
}
