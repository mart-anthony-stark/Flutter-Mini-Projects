import 'package:flashcards/common/AppColor.dart';
import 'package:flashcards/flashcard_view.dart';
import 'package:flashcards/models/flashcard.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          // Define the default brightness and colors.
          brightness: Brightness.light,
          primaryColor: AppColor.PRIMARY,

          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
          textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            titleLarge: TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
            bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
          ),
        ),
        home: const Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Flashcard> flashcards = [
    Flashcard(
        question:
            "A storage format that defines the way data is stored, organized, and manipulated. Some popular categories are Arrays, Trees, and Graphs.",
        answer: "Data Structure"),
    Flashcard(
        question:
            "Commonly referred to as a collection of items stored at contiguous memory locations. Items stored are of the same type. It organizes data so that a related set of values can be easily sorted or searched.",
        answer: "Array"),
    Flashcard(
        question:
            "Refers to a linear data structure in which the elements are not necessarily stored in a contiguous manner. It is basically a sequence of nodes, each node points towards the next node forming a chain-like structure.",
        answer: "Linked List"),
    Flashcard(
        question:
            "Refers to a linear data structure performing operations in a LIFO (Last In First Out) order. Elements can only be accessed, starting from the topmost to the bottom element.",
        answer: "Stack"),
    Flashcard(
        question:
            "Refers to a linear data structure that performs operations in a FIFO order. The least recently added elements are removed first as opposed to a stack.",
        answer: "Queue"),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.light,
        primaryColor: AppColor.PRIMARY,

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
              SizedBox(
                  width: 250,
                  height: 250,
                  child: FlipCard(
                    front: FlashcardView(
                      text: flashcards[_currentIndex].question,
                    ),
                    back: FlashcardView(
                        text: flashcards[_currentIndex].answer, side: "back"),
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    OutlinedButton(
                        onPressed: showPreviousCard,
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
                        onPressed: showNextCard,
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

  void showNextCard() {
    setState(() {
      _currentIndex =
          _currentIndex < flashcards.length - 1 ? _currentIndex + 1 : 0;
    });
  }

  void showPreviousCard() {
    setState(() {
      _currentIndex =
          _currentIndex == 0 ? flashcards.length - 1 : _currentIndex - 1;
    });
  }
}
