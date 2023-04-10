// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, prefer_const_constructors, camel_case_types, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const APP());
}

class APP extends StatelessWidget {
  const APP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fa', ''), // farsi
      ],
      theme: ThemeData(
        snackBarTheme: SnackBarThemeData(),
        fontFamily: 'Estedad',
        textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: 'Estedad',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.black),
            bodyText1: TextStyle(
                fontSize: 13, fontWeight: FontWeight.w300, color: Colors.black),
            headline2: TextStyle(
                fontFamily: 'Estedad',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.white),
            bodyText2: TextStyle(
                fontFamily: 'Estedad',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.black),
            headline3: TextStyle(
                fontFamily: 'Estedad',
                fontSize: 18,
                fontWeight: FontWeight.w900,
                color: Colors.white,
                shadows: <Shadow>[Shadow(offset: Offset(1, 2))]),
            headline4: TextStyle(
                fontFamily: 'Estedad',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black)),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
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
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [
            Image.asset('assets/images/icon.png'),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'قیمت به روز ارز',
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
            // const SizedBox(width: 200),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset('assets/images/menu.png'),
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset('assets/images/Question Mark.png'),
                  const SizedBox(width: 8),
                  Text(
                    'نرخ ارز آزاد چیست؟',
                    style: Theme.of(context).textTheme.headline1,
                  )
                ],
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  Text(
                    '''نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند
که خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.''',
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 34,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: const Color.fromARGB(255, 130, 130, 130),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'نام آزاد ارز',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'قیمت',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Text(
                        'تغییر',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemCount: 6,
                    itemBuilder: (BuildContext, int) {
                      return List_Arz();
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      if (index % 4 == 0) {
                        return Tablihgat();
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),
                ),
              ),
              // update button text
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 232, 232),
                      borderRadius: BorderRadius.circular(1000)),
                  child: Row(
                    children: [
                      // Update btn
                      Container(
                        width: 170,
                        height: 50,
                        child: TextButton.icon(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(1000))),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              // اگر دکمه فشار داده شده شود , آبی و در غیر این صورت خاکستری
                              if (states.contains(MaterialState.pressed)) {
                                return const Color.fromARGB(255, 108, 90, 206);
                              }
                              return const Color.fromARGB(255, 202, 193, 255);
                            }),
                          ),
                          onPressed: () => _showSnackbar(
                              context, 'بروز رسانی با موفقیت انجام شد'),
                          icon: const Icon(
                            CupertinoIcons.refresh_bold,
                            color: Colors.black,
                          ),
                          label: Padding(
                            padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                            child: Text(
                              'بروزرسانی',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                        child: Text(
                          'آخرین به روز رسانی ${_gettime()}',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  String _gettime() {
    return '20:45';
  }
}

void _showSnackbar(BuildContext context, String Massege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      Massege,
      style: Theme.of(context).textTheme.headline1,
    ),
    backgroundColor: Color.fromARGB(255, 23, 165, 1),
    duration: const Duration(seconds: 1),
    elevation: 0.0,
  ));
}

class List_Arz extends StatelessWidget {
  const List_Arz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 1,
            spreadRadius: 0,
          )
        ], color: Colors.white, borderRadius: BorderRadius.circular(1000)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('درهم', style: Theme.of(context).textTheme.bodyText2),
            Text('101000', style: Theme.of(context).textTheme.bodyText2),
            const Text(
              '+5',
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Color.fromARGB(255, 2, 167, 68)),
            )
          ],
        ),
      ),
    );
  }
}

class Tablihgat extends StatelessWidget {
  const Tablihgat({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1000),
          color: Colors.red,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'کلیک کنید',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }
}
