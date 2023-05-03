import 'package:flutter/material.dart';
import 'package:notice_2_parents/Modele/student.dart';
import 'package:notice_2_parents/Services/studentApi.dart';

class StudentList extends StatefulWidget {
  const StudentList({super.key});

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Student>? students;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    students = await StudentApi().getAllStudent();
    if (students != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student list'),
      ),
      body: ListView.builder(
          itemCount: students?.length,
          itemBuilder: (context, index) {
            return Card(
              child: students?[index] != null
                  ? ListTile(
                      title: Text(students![index].acronym),
                      subtitle: Text(students![index].abandon
                          ? 'Abandoned'
                          : 'Not abandoned'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.edit)),
                          SizedBox(width: 8),
                          IconButton(
                              onPressed: () async {}, icon: Icon(Icons.delete)),
                        ],
                      ),
                    )
                  : Container(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
