// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, prefer_const_constructors, camel_case_types, must_be_immutable, deprecated_member_use, unnecessary_import, unused_import, file_names, use_key_in_widget_constructors, unused_element, use_build_context_synchronously, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:developer' as developer;
import 'package:intl/intl.dart' as intl;
import 'Model/Currency.dart';

void main() => runApp(APP());

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
              color: Colors.black),
          headline5: TextStyle(
              fontFamily: 'Estedad',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.red),
          headline6: TextStyle(
              fontFamily: 'Estedad',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.green),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<currency> curency = [];
  Future getResponse() async {
    var url = "http://sasansafari.com/flutter/api.php?access_key=flutter123456";
    var value = await http.get(Uri.parse(url));
    if (curency.isEmpty) {
      if (value.statusCode == 200) {
        _showSnackbar(context, "دریافت اطلاعات با موفقیت انجام شد!");
        List jsonList = convert.jsonDecode(value.body);
        if (jsonList.isNotEmpty) {
          for (var i = 0; i < jsonList.length; i++) {
            setState(() {
              curency.add(currency(
                id: jsonList[i]["id"],
                title: jsonList[i]["title"],
                price: jsonList[i]["price"],
                changes: jsonList[i]["changes"],
                status: jsonList[i]["status"],
              ));
            });
          }
        }
      }
    }

    return value;
  }

  @override
  void initState() {
    super.initState();
    developer.log("initstate", name: "wlifecycle");
  }

  @override
  Widget build(BuildContext context) {
    getResponse();
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        drawer: Drawer(),
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
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.black,
                    )),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/Question Mark.png'),
                    SizedBox(width: 8),
                    Text(
                      'نرخ ارز آزاد چیست؟',
                      style: Theme.of(context).textTheme.headline1,
                    )
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  '''نرخ ارزها در معاملات نقدی و رایج روزانه است معاملات نقدی معاملاتی هستند\nکه خریدار و فروشنده به محض انجام معامله، ارز و ریال را با هم تبادل می نمایند.''',
                  textDirection: TextDirection.rtl,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: height / 19,
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
                  padding: const EdgeInsets.fromLTRB(0, 9, 0, 0),
                  // List
                  child: SizedBox(
                      width: double.infinity,
                      height: height / 2,
                      child: ListFutureBuilder(context)),
                ),
                // update button text
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12, 0, 0),
                  child: Container(
                    width: double.infinity,
                    height: height / 16,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 232, 232, 232),
                        borderRadius: BorderRadius.circular(1000)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Update btn
                        SizedBox(
                          height: height / 16,
                          child: TextButton.icon(
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(1000))),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith((states) {
                                  // اگر دکمه فشار داده شده شود , آبی و در غیر این صورت خاکستری
                                  if (states.contains(MaterialState.pressed)) {
                                    return Color.fromARGB(255, 86, 10, 130);
                                  }
                                  return Color.fromARGB(255, 142, 18, 213);
                                })),
                            onPressed: () {
                              curency.clear();
                              ListFutureBuilder(context);
                            },
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
                        Text(
                          'آخرین به روز رسانی ${_gettime()}',
                        ),
                        SizedBox()
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }

  FutureBuilder<dynamic> ListFutureBuilder(BuildContext context) {
    return FutureBuilder(
      future: getResponse(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: curency.length,
                itemBuilder: (BuildContext, int position) {
                  return My_Item(position, curency);
                },
                separatorBuilder: (BuildContext context, int index) {
                  if (index % 5 == 0) {
                    return Tablihgat();
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              )
            : Center(
                child: CircularProgressIndicator(
                color: Colors.red,
              ));
      },
    );
  }

  String _gettime() {
    DateTime now = DateTime.now();
    return intl.DateFormat("kk:mm:ss").format(now);
  }
}

void _showSnackbar(BuildContext context, String Massege) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      Massege,
      style: Theme.of(context).textTheme.headline1,
    ),
    backgroundColor: Color.fromARGB(255, 23, 165, 1),
    duration: const Duration(seconds: 2),
    elevation: 0.0,
  ));
}

class My_Item extends StatelessWidget {
  int position;
  List<currency> curency;
  My_Item(this.position, this.curency) {
    key;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: Container(
        width: double.infinity,
        height: 65,
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
            Text(curency[position].title!,
                style: Theme.of(context).textTheme.bodyText2),
            Text(getFarsiNumber(curency[position].price.toString()),
                style: Theme.of(context).textTheme.bodyText2),
            Text(getFarsiNumber(curency[position].changes.toString()),
                textDirection: TextDirection.ltr,
                style: curency[position].status == "p"
                    ? Theme.of(context).textTheme.headline6
                    : Theme.of(context).textTheme.headline5)
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

String getFarsiNumber(String Number) {
  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '١', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (var element in en) {
    Number = Number.replaceAll(element, fa[en.indexOf(element)]);
  }
  return Number;
}
