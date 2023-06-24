import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getTime() async {
    // Make network request
    Uri uri = Uri.http("worldtimeapi.org", "/api/timezone/Asia/Manila");
    try {
      Response response = await get(uri);
      Map data = jsonDecode(response.body);

      // Get properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now.add(Duration(hours: int.parse(offset)));
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
