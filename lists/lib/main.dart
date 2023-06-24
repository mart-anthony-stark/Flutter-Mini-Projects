import 'package:flutter/material.dart';
import 'package:lists/widgets/quote_card.dart';
import 'classes/quote.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuoteList(),
    );
  }
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<Quote> quotes = [Quote("Quote 1", "Mart"), Quote("Quote 2", "Mart")];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Quotes"),
          centerTitle: true,
          backgroundColor: Colors.deepOrange,
        ),
        body: Column(
          children: quotes.map((item) {
            return QuoteCard(
                quote: item,
                delete: () {
                  setState(() {
                    quotes.remove(item);
                  });
                });
          }).toList(),
        ));
  }
}
