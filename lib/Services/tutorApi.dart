import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modele/tutor.dart';

class TutorApi {
  //Get all tutor details
  Future<List<Tutor>?> getAllTutor() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/tutor/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return tutorFromJson(json);
    }
  }

  //Get tutor by id
  Future<Tutor?> getParentById(int tutorId) async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/tutor/get/$tutorId');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      var tutorList = tutorFromJson(json);

      if (tutorList != null && tutorList.isNotEmpty) {
        return tutorList[0];
      }
    }

    return null;
  }
}
