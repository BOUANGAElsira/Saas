import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mysql1/mysql1.dart';

import '../Modele/student.dart';

class StudentApi {
  //Get all student details
  Future<List<Student>?> getAllStudent() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/student/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return studentFromJson(json);
    }
  }

}
