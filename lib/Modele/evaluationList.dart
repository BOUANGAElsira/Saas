import 'package:flutter/material.dart';
import 'package:notice_2_parents/Modele/addEvaluationForm.dart';
import 'package:notice_2_parents/Modele/evaluation.dart';
import 'package:intl/intl.dart';
import 'package:notice_2_parents/Modele/updateEvaluationForm.dart';
import '../Services/evaluationApi.dart';

class EvaluationList extends StatefulWidget {
  const EvaluationList({Key? key}) : super(key: key);

  @override
  State<EvaluationList> createState() => _EvaluationListState();
}

class _EvaluationListState extends State<EvaluationList> {
  List<Evaluation>? evaluations;
  var idsLoaded = false;

  @override
  void initState() {
    getRecord();
    super.initState();
  }

  getRecord() async {
    evaluations = await EvaluationApi().getAllEvaluations();
    if (evaluations != null) {
      setState(() {
        idsLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evaluations list'),
      ),
      body: ListView.builder(
          itemCount: evaluations?.length,
          itemBuilder: (context, index) {
            return Card(
              child: evaluations?[index] != null
                  ? ListTile(
                      title: Text(evaluations![index].type),
                      subtitle: Text(DateFormat('yyyy-MM-dd')
                          .format(evaluations![index].startDate)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () async {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(builder: (context)=> updateevaluationForm(evaluations![index]))
                              );
                            },
                            icon: Icon(Icons.edit)
                          ),
                          SizedBox(width: 8),
                          IconButton(
                              onPressed: () async {
                                Evaluation evaluation = await EvaluationApi()
                                    .deleteEvaluation(
                                        evaluations![index].id);
                              },
                              icon: Icon(Icons.delete)),
                        ],
                      ),
                    )
                  : Container(),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddEvaluationForm()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
