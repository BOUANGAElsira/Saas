import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../Modele/absence.dart';

class AbsenceApi {
  //Get all absences details
  Future<List<Absence>?> getAllAbsence() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/absence/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return absenceFromJson(json);
    }
  }
 
  //Get absence by id
  Future<Absence?> getParentById(int absenceId) async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/parent/get/$absenceId');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      var absenceList = absenceFromJson(json);

      if (absenceList != null && absenceList.isNotEmpty) {
        return absenceList[0];
      }
    }

    return null;
  }
}
