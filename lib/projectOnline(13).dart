// ignore_for_file: avoid_unnecessary_containers, unnecessary_const

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
      theme: ThemeData(
          fontFamily: 'Estedad',
          textTheme: const TextTheme(
              headline1: TextStyle(
                  fontFamily: 'Estedad',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              bodyText1: TextStyle(
                fontFamily: 'Estedad',
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
              headline2: TextStyle(
                  fontFamily: 'Estedad',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.white))),
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
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          actions: [
            Image.asset('assets/images/icon.png'),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'قیمت به‌ روز ارز',
                  style: Theme.of(context).textTheme.headline1,
                )),
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
                  Text('نرخ ارز آزاد چیست؟',
                      style: Theme.of(context).textTheme.headline1),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                'نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.',
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                    height: 34,
                    decoration: const BoxDecoration(
                        color: const Color.fromARGB(255, 130, 130, 130),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('نام آزاد ارز',
                            style: Theme.of(context).textTheme.headline2),
                        Text('قیمت',
                            style: Theme.of(context).textTheme.headline2),
                        Text('تغییر',
                            style: Theme.of(context).textTheme.headline2),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
