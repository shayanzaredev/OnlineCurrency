import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const app());
}

class app extends StatelessWidget {
  const app({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // Farsi
      ],
      theme: ThemeData(fontFamily: 'Estedad'),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: [
            Image.asset('assets/images/icon.png'),
            const Align(
                alignment: Alignment.centerRight,
                child: Text('قیمت به‌ روز ارز',
                    style: TextStyle(color: Colors.black))),
            Expanded(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset('assets/images/menu.png'))),
            const SizedBox(width: 16),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/Question Mark.png'),
                  const SizedBox(width: 8),
                  const Text('نرخ ارز آزاد چیست؟'),
                ],
              ),
              const SizedBox(height: 8),
              const Text(
                'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                style: TextStyle(color: Colors.black),
                textDirection: TextDirection.rtl,
              )
            ],
          ),
        ));
  }
}
