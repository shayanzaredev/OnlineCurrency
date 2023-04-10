import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is
//the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ClipOval',
      theme: ThemeData.dark(),
      home: MyHomePAGE(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePAGE extends StatefulWidget {
  @override
  _MyHomePAGEState createState() => _MyHomePAGEState();
}

class _MyHomePAGEState extends State<MyHomePAGE> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GeeksforGeeks"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: const RotatedBox(
              quarterTurns: 3,
              child: Text("Hello Shayan"),
            )),
      ),
    );
  }
}
