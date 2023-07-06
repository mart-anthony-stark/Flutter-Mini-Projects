import 'package:flashcards/common/AppColor.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: AppColor.PRIMARY,

        // Define the default font family.
        // fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flashcards'),
          backgroundColor: AppColor.PRIMARY,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                    front: FlashcardView(
                      text: "text",
                    ),
                    back: FlashcardView(text: "back", side: "back"),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.PRIMARY,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Prev",
                              style: TextStyle(color: AppColor.PRIMARY),
                            ),
                          ],
                        )),
                    OutlinedButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text(
                              "Next",
                              style: TextStyle(color: AppColor.PRIMARY),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: AppColor.PRIMARY,
                            )
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
