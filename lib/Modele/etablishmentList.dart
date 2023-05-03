import 'package:flutter/material.dart';
import 'package:notice_2_parents/Modele/etablishment.dart';
import 'package:notice_2_parents/Modele/student.dart';

import '../Services/etablishmentApi.dart';

class EtablishmentList extends StatefulWidget {
  const EtablishmentList({super.key});

  @override
  State<EtablishmentList> createState() => _EtablishmentListState();
}

class _EtablishmentListState extends State<EtablishmentList> {
   List<Etablishment>? etablishments;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    etablishments = await EtablishmentApi().getAllEtablibshment();
    if (etablishments != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etablishment list'),
      ),
      body: ListView.builder(
          itemCount: etablishments?.length,
          itemBuilder: (context, index) {
            return Card(
              child: etablishments?[index] != null
                  ? ListTile(
                      title: Text(etablishments![index].acronym),
                      subtitle: Text(etablishments![index].name),
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
