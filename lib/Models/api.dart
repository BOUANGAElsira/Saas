import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApi {
  static Future<List<dynamic>> getMyModels() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:5000/get-all-models'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}
