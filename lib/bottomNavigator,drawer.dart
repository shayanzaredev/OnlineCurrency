// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ShayanApp",
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: const AppState(),
    );
  }
}

class AppState extends StatefulWidget {
  const AppState({super.key});

  @override
  State<AppState> createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      print(index);
    });
  }

  List body = [
    "shayan0",
    "shayan1",
    "shayan2",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Hello progress")),
      ),
      drawer: Drawer(
        backgroundColor: Colors.purple,
        child: ListView(children: [
          const DrawerHeader(
            child: UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40),
              ),
              accountName: Text(
                "Shayan",
                style: TextStyle(fontSize: 18),
              ),
              accountEmail: Text('shayan@gmail.com'),
              currentAccountPictureSize: Size.square(55),
              decoration: BoxDecoration(color: Colors.purple),
            ),
          ),
          ListTile(
            leading: Icon(Icons.access_alarm),
            selectedColor: Colors.white,
            title: Text("Alarm"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.abc_outlined),
            selectedColor: Colors.white,
            title: Text("abc"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.zoom_out_sharp),
            selectedColor: Colors.white,
            title: Text("zoomOut"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 17,
          backgroundColor: Colors.purple,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Email"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          ],
          currentIndex: selectedIndex,
          onTap: onItemTapped),
      body: Center(
        child: Text(body.elementAt(selectedIndex)),
      ),
    );
  }
}
