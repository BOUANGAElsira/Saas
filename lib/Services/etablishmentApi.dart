import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:notice_2_parents/Modele/etablishment.dart';

class EtablishmentApi{
  //Get all etablishment details
  Future<List<Etablishment>?> getAllEtablibshment() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/etablishment/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return etablishmentFromJson(json);
    }
  }
}
