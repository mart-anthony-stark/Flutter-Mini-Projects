import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: NinjaCard()));
}

class NinjaCard extends StatefulWidget {
  const NinjaCard({super.key});

  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Colors.grey[800],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                  backgroundImage: AssetImage('assets/mart.jpg'), radius: 40),
            ),
            Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            const Text(
              'NAME',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Mart Anthony',
              style: TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'CURRENT LEVEL',
              style: TextStyle(color: Colors.grey, letterSpacing: 2),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '$ninjaLevel',
              style: const TextStyle(
                  color: Colors.amberAccent,
                  letterSpacing: 2,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.grey[400],
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'martsalazar0@gmail.com',
                  style: TextStyle(
                      color: Colors.grey[400], fontSize: 18, letterSpacing: 1),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel++;
          });
        },
        backgroundColor: Colors.grey[800],
        child: const Icon(Icons.add),
      ),
    );
  }
}
