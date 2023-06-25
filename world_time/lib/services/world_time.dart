// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String location;
  late String time;
  late String flag; // url to asset flag icon
  late String url;
  late bool isDaytime;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    // Make network request
    // Uri uri = Uri.parse("http://worldtimeapi.org/api/timezone/Asia/Manila");
    try {
      Uri uri = Uri.parse('https://timeapi.io/api/TimeZone/zone?timeZone=$url');
      http.Response response = await http.get(uri);
      Map data = jsonDecode(response.body);
      print(data);

      int utcOffsetSeconds = data["currentUtcOffset"]["seconds"];
      Duration offset = Duration(seconds: utcOffsetSeconds);

      String datetimeString = data["currentLocalTime"];
      DateTime now = DateTime.parse(datetimeString);
      now.add(offset);

      // Set time property
      isDaytime = now.hour >= 6 && now.hour < 8;
      time = DateFormat.jm().format(now);
    } catch (error) {
      print(error);
      time = "Could not get data";
    }
  }
}
