import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notice_2_parents/Modele/evaluation.dart';
import 'package:intl/intl.dart';

class EvaluationApi {
  //Get all evaluations details
  Future<List<Evaluation>?> getAllEvaluations() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/evaluation/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return evaluationFromJson(json);
    }
  }

  //Add new evaluation
  Future<Evaluation> addEvaluation(int rating, DateTime startDate,
      DateTime endDate, String type, String appreciation) async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/evaluation/add');
    final http.Response response = await client.post(uri,
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'rating': rating,
          'startDate': DateFormat('yyyy-MM-dd').format(startDate),
          'endDate': DateFormat('yyyy-MM-dd').format(endDate),
          'type': type,
          'appreciation': appreciation
        }));
    if (response.statusCode == 200) {
      var json = response.body;
      return Evaluation.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to save evaluation');
    }
  }

  //Delete evaluation
  Future<Evaluation> deleteEvaluation(int id) async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/evaluation/$id');
    final http.Response response = await client.delete(uri,
        headers: <String, String>{
          'Content-Type': 'application/json;charset=UTF-8'
        });
    if (response.statusCode == 200) {
      var json = response.body;
      return Evaluation.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to delete evaluation');
    }
  }

  //Update evaluation
  Future<Evaluation> updateEvaluation(int rating, DateTime startDate,
      DateTime endDate, String type, String appreciation, int id) async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/evaluation/$id');
    final http.Response response = await client.put(uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, dynamic>{
          'rating': rating,
          'startDate': DateFormat('yyyy-MM-dd').format(startDate),
          'endDate': DateFormat('yyyy-MM-dd').format(endDate),
          'type': type,
          'appreciation': appreciation
        }));
    if (response.statusCode == 200) {
      var json = response.body;
      print(json);
      return Evaluation.fromJson(jsonDecode(json));
    } else {
      throw Exception('Failed to update evaluation');
    }
  }
}
