// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
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
                  color: Colors.white),
              bodyText2: TextStyle(
                  fontFamily: 'Estedad',
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
              headline3: TextStyle(
                  fontFamily: 'Estedad',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              children: [
                Row(
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
                      width: double.infinity,
                      height: 34,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 130, 130, 130),
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Container(
                      width: double.infinity,
                      height: 350,
                      child: ListView.separated(
                        physics: const ClampingScrollPhysics(),
                        itemCount: 18,
                        itemBuilder: (BuildContext context, int position) {
                          return const listitem_Arz();
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          //  با این حرکت 9 بار یبار بین آیتم ها یه آیتم تبلیغ قرار میگیره
                          if (index % 9 == 0) {
                            return const Add_tab();
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 232, 232, 232),
                      borderRadius: BorderRadius.circular(1000),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              CupertinoIcons.refresh_bold,
                              color: Colors.black,
                            ),
                            label: Text(
                              'به روز رسانی',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 202, 193, 255)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000)))),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class listitem_Arz extends StatelessWidget {
  const listitem_Arz({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(boxShadow: const <BoxShadow>[
          BoxShadow(blurRadius: 1.0, color: Colors.grey)
        ], color: Colors.white, borderRadius: BorderRadius.circular(1000)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('یورو', style: Theme.of(context).textTheme.bodyText2),
            Text('26000', style: Theme.of(context).textTheme.bodyText2),
            Text('+5', style: Theme.of(context).textTheme.bodyText2),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class Add_tab extends StatelessWidget {
  const Add_tab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
      child: Container(
        width: double.infinity,
        height: 30,
        decoration: BoxDecoration(boxShadow: const <BoxShadow>[
          BoxShadow(blurRadius: 1.0, color: Colors.grey)
        ], color: Colors.red, borderRadius: BorderRadius.circular(1000)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text('کلیک کنید', style: Theme.of(context).textTheme.headline3),
          ],
        ),
      ),
    );
  }
}
