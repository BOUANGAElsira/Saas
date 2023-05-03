import 'dart:convert';
import 'package:intl/intl.dart';

List<Notifications> notificationFromJson(String str) => List<Notifications>.from(json.decode(str).map((x) => Notifications.fromJson(x)));

String notificationToJson(List<Notifications> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Notifications {
    String object;
    String type;
    DateTime sendPeriod;
    int idStatus;
    int idEvaluation;
    int idAbsence;
    int idTutor;
    int idParent;
    int idBulletin;

    Notifications({
        required this.object,
        required this.type,
        required this.sendPeriod,
        required this.idStatus,
        required this.idEvaluation,
        required this.idAbsence,
        required this.idTutor,
        required this.idParent,
        required this.idBulletin,
    });

    factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
        object: json["object"],
        type: json["type"],
        sendPeriod: DateTime.parse(json["sendPeriod"]),
        idStatus: json["idStatus"],
        idEvaluation: json["idEvaluation"],
        idAbsence: json["idAbsence"],
        idTutor: json["idTutor"],
        idParent: json["idParent"],
        idBulletin: json["idBulletin"],
    );

    Map<String, dynamic> toJson() => {
        "object": object,
        "type": type,
        "sendPeriod": "${sendPeriod.year.toString().padLeft(4, '0')}-${sendPeriod.month.toString().padLeft(2, '0')}-${sendPeriod.day.toString().padLeft(2, '0')}",
        "idStatus": idStatus,
        "idEvaluation": idEvaluation,
        "idAbsence": idAbsence,
        "idTutor": idTutor,
        "idParent": idParent,
        "idBulletin": idBulletin,
    };
}
