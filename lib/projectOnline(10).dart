import 'package:flutter/material.dart';

void main() {
  runApp(app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset('assets/image/menu.png'))),
              const Align(
                  alignment: Alignment.centerRight,
                  child: Text('قیمت به‌ روز ارز',
                      style: TextStyle(color: Colors.black))),
              Image.asset('assets/image/icon.png'),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('نرخ ارز آزاد چیست؟'),
                    const SizedBox(width: 8),
                    Image.asset('assets/image/Question Mark.png')
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  ' نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                  style: TextStyle(color: Colors.black),
                  textDirection: TextDirection.rtl,
                )
              ],
            ),
          )),
    );
  }
}
