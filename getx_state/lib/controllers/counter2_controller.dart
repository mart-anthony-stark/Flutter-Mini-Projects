import 'package:get/get.dart';

class Counter2Controller extends GetxController {
  var count = 0.obs;

  void increment() {
    count++;
    // update();
  }

  void cleanupTask() {
    print("clean");
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    increment();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();

    cleanupTask();
  }
}
