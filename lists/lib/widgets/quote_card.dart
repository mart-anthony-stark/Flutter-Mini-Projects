import 'package:flutter/material.dart';
import '../classes/quote.dart';

class QuoteCard extends StatelessWidget {
  final Quote quote;
  final Function delete;
  const QuoteCard({super.key, required this.quote, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(
            quote.text,
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(height: 16),
          Text(
            quote.author,
            style: const TextStyle(fontSize: 14, color: Colors.redAccent),
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: () {
              delete();
            },
            icon: const Icon(Icons.delete),
            label: const Text('Delete Quote'),
          )
        ]),
      ),
    );
  }
}
