import 'package:flutter/material.dart';
import 'package:notice_2_parents/Services/evaluationApi.dart';

class AddEvaluationForm extends StatefulWidget {
  const AddEvaluationForm({super.key});

  @override
  State<AddEvaluationForm> createState() => _AddEvaluationFormState();
}

class _AddEvaluationFormState extends State<AddEvaluationForm> {
  var _ratingEvaluationController = TextEditingController();
  var _startDateEvaluationController = TextEditingController();
  var _endDateEvaluationController = TextEditingController();
  var _typeEvaluationController = TextEditingController();
  var _appreciationEvaluationController = TextEditingController();

  bool _validateRating = false;
  bool _validateStartDate = false;
  bool _validateEndDate = false;
  bool _validateType = false;
  bool _validateAppreciation = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new evaluation'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                'Add new evaluation details',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.brown,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15.0,
              ),
              //Label de rating
              TextField(
                controller: _ratingEvaluationController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a rating of evaluation',
                  labelText: 'Rating',
                  errorText:
                      _validateRating ? 'Rating value ca not be empty' : null,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              //Label de startDate
              TextField(
                controller: _startDateEvaluationController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a start date of evaluation',
                  labelText: 'Start date',
                  errorText: _validateStartDate
                      ? 'Start date value ca not be empty'
                      : null,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              //Label de endDate
              TextField(
                controller: _endDateEvaluationController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a end date of evaluation',
                  labelText: 'End date',
                  errorText: _validateEndDate
                      ? 'End date value ca not be empty'
                      : null,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              //Label de type
              TextField(
                controller: _typeEvaluationController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a  type of evaluation',
                  labelText: 'Type',
                  errorText:
                      _validateType ? 'Type value ca not be empty' : null,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              //Label de appreciation
              TextField(
                controller: _appreciationEvaluationController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter a  appreciation of evaluation',
                  labelText: 'Appreciation',
                  errorText: _validateAppreciation
                      ? 'Appreciation value ca not be empty'
                      : null,
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () async {
                      setState(() {
                        _ratingEvaluationController.text.isEmpty
                            ? _validateRating = true
                            : _validateRating = false;
                        _startDateEvaluationController.text.isEmpty
                            ? _validateStartDate = true
                            : _validateStartDate = false;
                        _endDateEvaluationController.text.isEmpty
                            ? _validateEndDate = true
                            : _validateStartDate = false;
                        _typeEvaluationController.text.isEmpty
                            ? _validateType = true
                            : _validateType = false;
                        _appreciationEvaluationController.text.isEmpty
                            ? _validateAppreciation = true
                            : _validateAppreciation = false;
                      });
                      if (_validateRating == false &&
                          _validateStartDate == false &&
                          _validateEndDate == false &&
                          _validateType == false &&
                          _validateAppreciation == false) {
                        var result = await EvaluationApi().addEvaluation(
                            int.parse(_ratingEvaluationController.text),
                            DateTime.parse(_startDateEvaluationController.text),
                            DateTime.parse(_endDateEvaluationController.text),
                            _typeEvaluationController.text,
                            _appreciationEvaluationController.text);
                        Navigator.pop(context, result);
                      }
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.brown,
                        textStyle: TextStyle(fontSize: 12)),
                    child: Text('Save details'),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  TextButton(
                    onPressed: () {
                      _ratingEvaluationController.text = "";
                      _startDateEvaluationController.text = "";
                      _endDateEvaluationController.text = "";
                      _typeEvaluationController.text = "";
                      _appreciationEvaluationController.text = "";
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.cyanAccent,
                        textStyle: TextStyle(fontSize: 12)),
                    child: Text('Clear details'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}