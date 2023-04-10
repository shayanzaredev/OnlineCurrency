// ignore_for_file: sort_child_properties_last, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:like_button/like_button.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Poppins',
          snackBarTheme: SnackBarThemeData(),
          textTheme: const TextTheme(
              bodyText1: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
          ))),
      debugShowCheckedModeBanner: false,
      home: Padding(
        padding: const EdgeInsets.fromLTRB(7, 0, 7, 7),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(80),
                  bottomRight: Radius.circular(80)),
              child: Image.asset(
                'assets/images/12.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 320,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(70, 0, 0, 60),
                  child: Text(
                    's',
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1000),
                        color: Color.fromARGB(255, 214, 214, 214),
                      ),
                      height: 40,
                      width: 40,
                      child: LikeButton(
                        size: 20,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        likeBuilder: (istapped) {
                          return Icon(
                            CupertinoIcons.bookmark,
                            color: istapped ? Colors.deepPurple : Colors.black,
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(23.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: Color.fromARGB(255, 214, 214, 214),
                            ),
                            height: 40,
                            width: 40,
                            child: LikeButton(
                              size: 20,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              likeBuilder: (istapped) {
                                return Icon(
                                  CupertinoIcons.heart,
                                  color: istapped ? Colors.red : Colors.black,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




// Container(width: double.infinity, height: 200, color: Colors.red),