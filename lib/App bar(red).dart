import 'package:flutter/material.dart';

void main() {
  runApp(ClassName());
}

class ClassName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
          centerTitle: true,
          backgroundColor: Colors.red,
          leading: const Icon(Icons.menu),
        ),
        body: const Center(child: Text('"Hello shayan"')),
      ),
    );
  }
}
