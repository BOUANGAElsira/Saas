import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../Modele/notification.dart';

class NotificationApi{
  //Get all notifications details
  Future<List<Notifications>?> getAllNotification() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:5000/notification/get');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return notificationFromJson(json);
    }
  }
}
