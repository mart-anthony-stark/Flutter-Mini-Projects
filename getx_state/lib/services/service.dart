import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Service extends GetxService {
  Future<void> incrementCounter() async {
    // ignore: invalid_use_of_visible_for_testing_member
    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0);
    prefs.setInt("counter", counter + 1);
    print("Pressed $counter times.");
    await prefs.setInt('counter', counter);
  }
}
