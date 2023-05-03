import 'dart:convert';
import 'package:intl/intl.dart';

List<Absence> absenceFromJson(String str) => List<Absence>.from(json.decode(str).map((x) => Absence.fromJson(x)));

String absenceToJson(List<Absence> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Absence {
    DateTime startDate;
    DateTime endDate;
    String observation;
    String justification;
    String justificationPiece;
    int idSeance;
    int identificationNumber;

    Absence({
        required this.startDate,
        required this.endDate,
        required this.observation,
        required this.justification,
        required this.justificationPiece,
        required this.idSeance,
        required this.identificationNumber,
    });

    factory Absence.fromJson(Map<String, dynamic> json) => Absence(
        startDate: DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz')
            .parse(json["startDate"]),
        endDate:
            DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(json["endDate"]),
        observation: json["observation"],
        justification: json["justification"],
        justificationPiece: json["justificationPiece"],
        idSeance: json["idSeance"],
        identificationNumber: json["identificationNumber"],
    );

    Map<String, dynamic> toJson() => {
        "startDate": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "observation": observation,
        "justification": justification,
        "justificationPiece": justificationPiece,
        "idSeance": idSeance,
        "identificationNumber": identificationNumber,
    };
}
