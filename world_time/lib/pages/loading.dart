// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  final spinkit = SpinKitFadingCircle(
    itemBuilder: (BuildContext context, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: index.isEven ? Colors.red : Colors.green,
        ),
      );
    },
  );

  void setupWorldTime(context) async {
    WorldTime wt =
        WorldTime(location: "Philippines", flag: 'ph.png', url: "Asia/Manila");

    await wt.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': wt.location,
      'flag': wt.flag,
      'time': wt.time,
      'isDaytime': wt.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();

    setupWorldTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: const Padding(
          padding: EdgeInsets.all(50.0),
          child: SpinKitWave(
            color: Colors.white,
            size: 50.0,
          ),
        ));
  }
}
