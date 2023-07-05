import 'package:get/get.dart';
import 'package:getx_state/classes/student.dart';

class MyController extends GetxController {
  // var student = Student();
  var student = Student(name: "Mart", age: 12).obs;

  void convertToUpperCase() {
    // Individual variables are observable
    // student.name.value = student.name.value.toUpperCase();

    // Entire class is observable
    student.update((student) {
      student?.name = student.name.toString().toUpperCase();
      student?.age++;
    });
  }
}
