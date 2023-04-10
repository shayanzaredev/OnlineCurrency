import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            title: Row(children: [
          const SizedBox(
            width: 8,
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset("assets/image/menu.png"))),
          const Text('قیمت بروز سکه و ارز'),
          Image.asset("assets/image/icon.png"),
        ])),
        body: const Center(child: Text('"My App shayan"')),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
