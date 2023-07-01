import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "SnackBar",
        home: Scaffold(
          appBar: AppBar(title: const Text("GetX Snackbar")),
          body: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                  onPressed: () {
                    Get.snackbar("Snackbar Title", "Snackbar Message",
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundGradient: const LinearGradient(colors: [
                          Color.fromARGB(255, 98, 0, 117),
                          Color.fromARGB(255, 17, 0, 255),
                        ]),
                        colorText: Colors.white,
                        isDismissible: true,
                        dismissDirection: DismissDirection.horizontal,
                        icon: const Icon(
                          Icons.check,
                          color: Colors.white,
                        ),
                        mainButton: TextButton(
                            onPressed: () {},
                            child: const Icon(
                              Icons.send,
                              color: Colors.white,
                            )), onTap: (val) {
                      print("clicked");
                    }, margin: const EdgeInsets.all(10));
                  },
                  child: const Text('Show Snackbar')),
              ElevatedButton(onPressed: () {}, child: const Text("Show Dialog"))
            ],
          )),
        ));
  }
}
