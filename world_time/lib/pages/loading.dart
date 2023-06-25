// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = "Loading...";

  void setupWorldTime() async {
    WorldTime wt =
        WorldTime(location: "Philippines", flag: 'ph.png', url: "Asia/Manila");

    await wt.getTime();
    setState(() {
      time = ('time: ${wt.time}');
    });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50.0),
      child: Text(time),
    ));
  }
}
