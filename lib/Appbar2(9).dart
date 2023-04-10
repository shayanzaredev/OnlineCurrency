import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              title: Row(
            children: [
              Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/image/menu.png'))),
              const Center(
                child: Text('قیمت به‌ روز ارز'),
              ),
              Image.asset('assets/image/icon.png'),
            ],
          )),
          body: const Center(
            child: Text('"Hello SHayan"'),
          )),
    );
  }
}
