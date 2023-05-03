import 'package:flutter/material.dart';
import 'package:notice_2_parents/Modele/parent.dart';

import '../Services/parentApi.dart';

class ParentList extends StatefulWidget {
  const ParentList({super.key});

  @override
  State<ParentList> createState() => _ParentListState();
}

class _ParentListState extends State<ParentList> {
  List<Parent>? parents;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    parents = await ParentApi().getAllParent();
    if (parents != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parent list'),
      ),
      body: ListView.builder(
          itemCount: parents?.length,
          itemBuilder: (context, index) {
            return Card(
              child: parents?[index] != null
                  ? ListTile(
                      title: Text(parents![index].functionParent),
                      //subtitle: Text(parents![index]. ? 'Abandoned' : 'Not abandoned'),
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