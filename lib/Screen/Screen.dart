import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notice_2_parents/Modele/Institution.dart';
import 'package:notice_2_parents/Screen/ChatScreen.dart';
import 'package:notice_2_parents/Screen/Notification.dart';
import 'package:notice_2_parents/Screen/NotificationService.dart';
import 'package:notice_2_parents/Screen/NotificationSetting.dart';
import 'package:notice_2_parents/Screen/SchoolCalendar.dart';
import 'package:notice_2_parents/Screen/profile.dart';

import '../Utils/Student.dart';

class Screen_page extends StatefulWidget {
  const Screen_page({super.key});

  @override
  State<Screen_page> createState() => _Screen_pageState();
}

class _Screen_pageState extends State<Screen_page> {
  /*  List<Institution> maListeDInstitutions = [
    new Institution("LG", "Louis-Grégory", "Ecole pivée"),
    new Institution("UL", "Université de Lomé", "Université"),
  ]; */

  int cpt = 0;

  void initState() {
    super.initState();
    print('This is the initial state.');
    Institution institution = Institution();
    institution.display(); // I am trying to execute the function here.
  }

  //late Institution monInstitutionActuel;
  /* @override
  void initState() {
    super.initState();
    monInstitutionActuel = maListeDInstitutions[0];
  } */
  List<Widget> tabs = [
    Center(child: Text("Home", style: TextStyle(color: Colors.white))),
    Center(child: Text("Profile", style: TextStyle(color: Colors.white))),
    Center(child: Text("Notification", style: TextStyle(color: Colors.white))),
  ];

  int selectedIndex = 0;

  static List<Widget> widgdetOptions = <Widget>[
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
      textDirection: TextDirection.ltr,
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
        actions: [
          IconButton(
              onPressed: AccesChat,
              icon: Icon(Icons.chat))
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView(
            children: [
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage("lib/Assets/Images/defitech.jpg"),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Institutions",
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        )),
                  ],
                ),
              ),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage("lib/Assets/Images/etudiants_africains.jpg"),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    TextButton(
                        onPressed: studentInfo,
                        child: Text(
                          "Students",
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        )),
                  ],
                ),
              ),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage("lib/Assets/Images/image_parents.jpg"),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Tutors",
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        )),
                  ],
                ),
              ),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage("lib/Assets/Images/presence.jpeg"),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Presence",
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        )),
                  ],
                ),
              ),
              Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Ink.image(
                      image: AssetImage("lib/Assets/Images/evaluation.jpg"),
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 6),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Evaluation",
                          style: TextStyle(fontSize: 15, color: Colors.cyan),
                        )),
                  ],
                ),
              ),

            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
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
            ListTile(
              title: const Text('Institution'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home,
                    size: 30,
                    color: Colors.black,
                  )),
              SizedBox.shrink(),
              IconButton(
                  onPressed: appuye,
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    color: Colors.black,
                  )),
              SizedBox.shrink(),
              IconButton(
                  onPressed: Appuye,
                  icon: Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.black,
                  )),
              SizedBox.shrink(),
              IconButton(
                  onPressed: appuyeCalendrier,
                  icon: Icon(
                    Icons.calendar_view_day,
                    size: 30,
                    color: Colors.black,
                  ))

            ],
          ),
        ),
      ),
    );
  }

  void appuye() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Profile_Page()),
    );
  }

  void Appuye() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }

  void appuyeCalendrier() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SchoolCalendarView()),
    );
  }

  void studentInfo(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentInfoView(studentId: '1'),
      ),
    );
  }

  void AccesChat(){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(teacherId: '1'),
      ),
    );
  }

}
