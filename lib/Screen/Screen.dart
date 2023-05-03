import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notice_2_parents/Modele/Institution.dart';
import 'package:notice_2_parents/Modele/absnceList.dart';
import 'package:notice_2_parents/Modele/etablishmentList.dart';
import 'package:notice_2_parents/Modele/evaluationList.dart';
import 'package:notice_2_parents/Modele/parentList.dart';
import 'package:notice_2_parents/Modele/personList.dart';
import 'package:notice_2_parents/Modele/tutorList.dart';
import 'package:notice_2_parents/Models/viewModels.dart';
import 'package:notice_2_parents/Screen/ChatScreen.dart';
import 'package:notice_2_parents/Screen/Notification.dart';
import 'package:notice_2_parents/Screen/NotificationService.dart';
import 'package:notice_2_parents/Screen/NotificationSetting.dart';
import 'package:notice_2_parents/Screen/SchoolCalendar.dart';
import 'package:notice_2_parents/Screen/profile.dart';
import '../Modele/studentList.dart';
import '../Utils/Student.dart';

class Screen_page extends StatefulWidget {
  const Screen_page({super.key});

  @override
  State<Screen_page> createState() => _Screen_pageState();
}

class _Screen_pageState extends State<Screen_page> {
  int cpt = 0;
  int notificationCount = 0;

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
        //backgroundColor: Theme.of(context).primaryColor,
        elevation: 5,
        title: Text(
          "Home page",
          textAlign: TextAlign.center,
        ),
        actions: [IconButton(onPressed: AccesChat, icon: Icon(Icons.chat))],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView(
            children: [
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EtablishmentList()));
                          },
                          child: Text(
                            "Institutions",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage(
                            "lib/Assets/Images/etudiants_africains.jpg"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => StudentList(),
                              ),
                            );
                          },
                          child: Text(
                            "Students",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Ink.image(
                        image:
                            AssetImage("lib/Assets/Images/image_parents.jpg"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TutorList()),
                            );
                          },
                          child: Text(
                            "Tutors",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("lib/Assets/Images/absence.jpg"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AbsenceList()),
                            );
                          },
                          child: Text(
                            "Absence",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EvaluationList()),
                            );
                          },
                          child: Text(
                            "Evaluation",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("lib/Assets/Images/parent.jpg"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ParentList()),
                            );
                          },
                          child: Text(
                            "Parents",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
              Card(
                color: Color.fromARGB(200, 249, 200, 220),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Ink.image(
                        image: AssetImage("lib/Assets/Images/parent.jpg"),
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 6),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PersonList()),
                            );
                          },
                          child: Text(
                            "Persons",
                            style: TextStyle(fontSize: 15, color: Colors.brown),
                          )),
                    ],
                  ),
                ),
              ),
            ],
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown,
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
                    //color: Colors.black,
                  )),
              SizedBox.shrink(),
              IconButton(
                  onPressed: appuye,
                  icon: Icon(
                    Icons.person,
                    size: 30,
                    //color: Colors.black,
                  )),
              SizedBox.shrink(),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                },
                icon: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      size: 30,
                    ),
                    if (notificationCount > 0)
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            notificationCount.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
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

/*   void Appuye() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NotificationPage()),
    );
  }
 */
/*   void appuyeCalendrier() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SchoolCalendarView()),
    );
  }
 */
  /*  void studentInfo() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => StudentInfoView(studentId: '1'),
      ),
    );
  } */

  void AccesChat() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(teacherId: '1'),
      ),
    );
  }
}
