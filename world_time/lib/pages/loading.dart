// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime(context) async {
    WorldTime wt =
        WorldTime(location: "Philippines", flag: 'ph.png', url: "Asia/Manila");

    await wt.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
    });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
      padding: EdgeInsets.all(50.0),
      child: Text("Loading..."),
    ));
  }
}
