import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modele/person.dart';

class personApi{
  //Get all person details
  Future<List<Person>?> getAllPerson() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/person/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return personFromJson(json);
    }
  }
}
