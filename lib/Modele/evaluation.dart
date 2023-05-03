import 'dart:convert';
import 'package:intl/intl.dart';

List<Evaluation> evaluationFromJson(String str) =>
    List<Evaluation>.from(json.decode(str).map((x) => Evaluation.fromJson(x)));

String evaluationToJson(List<Evaluation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Evaluation {
  Evaluation({
    required this.rating,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.appreciation,
    required this.id,
  });

  int rating;
  DateTime startDate;
  DateTime endDate;
  String type;
  String appreciation;
  int id;

  factory Evaluation.fromJson(Map<String, dynamic> json) => Evaluation(
        rating: json["rating"].toInt(),
        startDate: DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz')
            .parse(json["startDate"]),
        endDate:
            DateFormat('EEE, dd MMM yyyy HH:mm:ss zzz').parse(json["endDate"]),
        type: json["type"],
        appreciation: json["appreciation"],
        id: json["id"] != null ? json["id"] as int : 0,

      );

  Map<String, dynamic> toJson() => {
        "rating": rating,
        "startDate":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "endDate":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "type": type,
        "appreciation": appreciation,
        "id": id,
      };
}
