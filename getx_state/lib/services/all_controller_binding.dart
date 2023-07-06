import 'package:get/get.dart';
import 'package:getx_state/controllers/counter2_controller.dart';
import 'package:getx_state/controllers/counter_controller.dart';

class AllControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CounterController>(() => CounterController());
    Get.lazyPut<Counter2Controller>(() => Counter2Controller());
  }
}
