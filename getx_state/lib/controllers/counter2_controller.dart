import 'package:get/get.dart';

class Counter2Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
    // update();
  }
}
