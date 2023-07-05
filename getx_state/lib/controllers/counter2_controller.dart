import 'package:get/get.dart';

class Counter2Controller extends GetxController {
  // var count = 0.obs;
  var count = 0;

  void increment() {
    count++;
    update(['txtCount']);
  }

  void cleanupTask() {
    print("clean");
  }

  @override
  void onInit() {
    super.onInit();
    increment();
  }

  @override
  void onClose() {
    super.onClose();

    cleanupTask();
  }
}
