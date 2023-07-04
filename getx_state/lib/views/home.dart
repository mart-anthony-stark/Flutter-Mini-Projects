import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          ElevatedButton(
              onPressed: () async {
                var data = await Get.to(const Screen2(),
                    fullscreenDialog: true,
                    transition: Transition.zoom,
                    duration: Duration(milliseconds: 300),
                    arguments: {'name': "mart"});
                print(data);
              },
              child: const Text("Go to next screen"))
        ],
      )),
    );
  }
}
