import 'dart:convert';

import 'package:notice_2_parents/Modele/person.dart';

List<Student> studentFromJson(String str) => List<Student>.from(json.decode(str).map((x) => Student.fromJson(x)));

String studentToJson(List<Student> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Student {
    Student({
        required this.identificationNumber,
        required this.abandon,
        required this.acronym,
        required this.idTutor,
        required this.idEvaluation,
        required this.idSubject,
    });

    int identificationNumber;
    bool abandon;
    String acronym;
    int idTutor;
    int idEvaluation;
    int idSubject;

    factory Student.fromJson(Map<String, dynamic> json) => Student(
        identificationNumber: json["identificationNumber"],
        abandon: json["abandon"] == 1,
        acronym: json["acronym"] ?? '',
        idTutor: json["idTutor"] ?? 0,
        idEvaluation: json["idEvaluation"] ?? 0,
        idSubject: json["idSubject"] ?? 0,
    );

  get person => null;

    Map<String, dynamic> toJson() => {
        "abandon": abandon,
        "acronym": acronym,
        "idTutor": idTutor,
        "idEvaluation": idEvaluation,
        "idSubject": idSubject,
    };
}