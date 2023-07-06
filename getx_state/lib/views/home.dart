import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state/controllers/counter_controller.dart';
import 'package:getx_state/views/screen2.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final _nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("GetX")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Obx(() => Text("Count: ${Get.find<CounterController>().count}")),
          // Snackbar
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
          // Dialog
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  title: "Title",
                  titleStyle: const TextStyle(fontSize: 23),
                  middleText: "Middle Text",
                  textConfirm: "Confirm",
                  textCancel: "Cancel",
                  onConfirm: () {
                    print(_nameController.text);
                    Get.back(closeOverlays: true);
                    _nameController.text = "";
                  },
                  content: Column(
                    children: <Widget>[
                      const Text("Hello"),
                      TextField(
                        controller: _nameController,
                        decoration: const InputDecoration(hintText: "Username"),
                      )
                    ],
                  ),
                  // confirm: IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.send)),
                  // backgroundColor:
                  //     const Color.fromARGB(255, 201, 201, 201)
                );
              },
              child: const Text("Show Dialog")),
          // Bottomsheet
          ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                    Container(
                      // color: Colors.white,
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Wrap(children: <Widget>[
                        ListTile(
                          leading: const Icon(Icons.wb_sunny_outlined,
                              color: Colors.white),
                          title: const Text('Light theme',
                              style: TextStyle(color: Colors.white)),
                          onTap: () {
                            Get.changeTheme(ThemeData.light());
                            Get.back(closeOverlays: true);
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.dark_mode,
                            color: Colors.white,
                          ),
                          title: const Text(
                            'Dark theme',
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            Get.changeTheme(ThemeData.dark());
                            Get.back(closeOverlays: true);
                          },
                        ),
                      ]),
                    ),
                    // barrierColor: Colors.greenAccent.shade100
                    backgroundColor: const Color.fromARGB(255, 175, 85, 190));
              },
              child: const Text("Show bottomsheet")),
          // Unnamed Route Navigation
          ElevatedButton(
              onPressed: () async {
                var data = await Get.to(const Screen2(),
                    fullscreenDialog: true,
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 300),
                    arguments: {'name': "mart"});
                print(data);
              },
              child: const Text("Go to next screen")),
          // Named Route Navigation
          ElevatedButton(
              onPressed: () async {
                // var data = await Get.toNamed(
                //   '/screen2',
                //   arguments: {'name': "mart"},
                // );
                // print(data);
                // No option to return to previous screen
                // Get.offNamed("screen2");
                // Get.offAllNamed("screen2");
                // Dynamic URL Link
                // Get.toNamed('/screen2?name=Mart Anthony&content=Flutter GetX');
                Get.toNamed('/screen2/1');
              },
              child: const Text("Go to screen 2")),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/counter");
              },
              child: const Text('Counter')),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/counter2");
              },
              child: const Text('Counter2')),
          //Reactive class
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/reactive-class");
              },
              child: const Text('Reactive Class')),
          // Services
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/services");
              },
              child: const Text('Services')),
          ElevatedButton(
              onPressed: () {
                Get.toNamed("/cosmetics");
              },
              child: const Text('Fetch API')),
        ],
      )),
    );
  }
}
