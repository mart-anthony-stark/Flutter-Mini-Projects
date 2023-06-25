// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // Make network request
    // Uri uri = Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Manila");
    Uri uri =
        Uri.parse("https://timeapi.io/api/TimeZone/zone?timeZone=Asia/Manila");
    try {
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);
      print(data);

      // Using World Time Api
      // String datetime = data['datetime'];
      // String offset = data['utc_offset'].substring(1, 3);

      // DateTime now = DateTime.parse(datetime);
      // now.add(Duration(hours: int.parse(offset)));

      // Using timeapi
      // // Create datetime object

      int utcOffsetSeconds = data["currentUtcOffset"]["seconds"];
      Duration offset = Duration(seconds: utcOffsetSeconds);

      String datetimeString = data["currentLocalTime"];
      DateTime now = DateTime.parse(datetimeString);
      now.add(offset);

      print(now);
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();

    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('Loading..'));
  }
}
