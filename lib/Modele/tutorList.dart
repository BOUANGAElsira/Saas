import 'package:flutter/material.dart';
import 'package:notice_2_parents/Modele/student.dart';
import 'package:notice_2_parents/Modele/tutor.dart';

import '../Services/tutorApi.dart';

class TutorList extends StatefulWidget {
  const TutorList({super.key});

  @override
  State<TutorList> createState() => _TutorListState();
}

class _TutorListState extends State<TutorList> {
  List<Tutor>? tutors;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    tutors = await TutorApi().getAllTutor();
    if (tutors != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor list'),
      ),
      body: ListView.builder(
          itemCount: tutors?.length,
          itemBuilder: (context, index) {
            return Card(
              child: tutors?[index] != null
                  ? ListTile(
                      title: Text(tutors![index].functionTutor),
                      //subtitle: Text(tutors![index]. ? 'Abandoned' : 'Not abandoned'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: ()  {},
                            icon: Icon(Icons.edit)
                          ),
                          SizedBox(width: 8),
                          IconButton(
                              onPressed: () async {},
                              icon: Icon(Icons.delete)),
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