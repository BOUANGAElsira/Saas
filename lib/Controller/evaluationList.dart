/* import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EvaluationList extends StatefulWidget {
  const EvaluationList({super.key});

  @override
  State<EvaluationList> createState() => _EvaluationListState();
}

class _EvaluationListState extends State<EvaluationList> {
  final CollectionReference _evaluation =
      FirebaseFirestore.instance.collection('evaluation');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Evaluation list'),
      ),
      body: StreamBuilder(
        stream: _evaluation.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> filteredEvaluations =
                streamSnapshot.data!.docs.toList();

            return ListView.builder(
              itemCount: filteredEvaluations.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    filteredEvaluations[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['type']),
                    subtitle: Text(documentSnapshot['startDate'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('Erreur de chargement des évaluations'),
          );
        },
      ),
    );
  }
}
 */