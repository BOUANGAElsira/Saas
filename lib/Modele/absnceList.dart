import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Services/absenceApi.dart';
import 'absence.dart';

class AbsenceList extends StatefulWidget {
  const AbsenceList({super.key});

  @override
  State<AbsenceList> createState() => _AbsenceListState();
}

class _AbsenceListState extends State<AbsenceList> {
  List<Absence>? absences;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    absences = await AbsenceApi().getAllAbsence();
    if (absences != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Absences list'),
      ),
      body: ListView.builder(
          itemCount: absences?.length,
          itemBuilder: (context, index) {
            return Card(
              child: absences?[index] != null
                  ? ListTile(
                      title: Text(absences![index].justification),
                      subtitle: Text(DateFormat('yyyy-MM-dd')
                          .format(absences![index].startDate)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.edit)
                          ),
                          SizedBox(width: 8),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    )
                  : Container(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
