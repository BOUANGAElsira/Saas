import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class Screen_page extends StatefulWidget {
  const Screen_page({super.key});

  @override
  State<Screen_page> createState() => _Screen_pageState();
}

class _Screen_pageState extends State<Screen_page> {
  int selectedIndex = 0;

  static const List<Widget> widgdetOptions = <Widget>[
    Text(
      "Home",
      style: TextStyle(fontSize: 30),
    ),
    Text(
      "Notifications",
      style: TextStyle(fontSize: 30),
    ),
    Text(
      "Profile",
      style: TextStyle(fontSize: 30),
    ),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        title: Text(
          "Home page",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: widgdetOptions.elementAt(selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.brown,
              ),
              child: Text('More options'),
            ),
            ListTile(
              title: const Text('Students'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Tutors'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Presence'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Evaluation'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationBar(
          backgroundColor: Colors.blueGrey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notifications",
                backgroundColor: Colors.yellow),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Colors.yellow),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.purple,
          iconSize: 30,
          onTap: onItemTapped,
          elevation: 10,
        ),
      ),
    );
  }
}
