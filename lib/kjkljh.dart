import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Center(child: Text('مهدییییییی')),
            backgroundColor: Colors.grey,
          ),
          body: const Center(
            child: Center(),
          )),
    );
  }
}
