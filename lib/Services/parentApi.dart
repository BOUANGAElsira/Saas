import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Modele/parent.dart';

class ParentApi {
  //Get all tutor details
  Future<List<Parent>?> getAllParent() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/parent/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return parentFromJson(json);
    }
  }

  //Get parent by id
  Future<Parent?> getParentById(int parentId) async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/parent/get/$parentId');
    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      var parentList = parentFromJson(json);

      if (parentList != null && parentList.isNotEmpty) {
        return parentList[0];
      }
    }

    return null;
  }
}
