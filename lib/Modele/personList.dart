import 'package:flutter/material.dart';
import 'package:notice_2_parents/Modele/person.dart';

import '../Services/personApi.dart';

class PersonList extends StatefulWidget {
  const PersonList({super.key});

  @override
  State<PersonList> createState() => _PersonListState();
}

class _PersonListState extends State<PersonList> {

  List<Person>? persons;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    persons = await personApi().getAllPerson();
    if (persons != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Person list'),
      ),
      body: ListView.builder(
          itemCount: persons?.length,
          itemBuilder: (context, index) {
            return Card(
              child: persons?[index] != null
                  ? ListTile(
                      title: Text(persons![index].name),
                      subtitle: Text(persons![index].type),
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