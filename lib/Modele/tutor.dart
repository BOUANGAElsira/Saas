import 'dart:convert';

List<Tutor> tutorFromJson(String str) => List<Tutor>.from(json.decode(str).map((x) => Tutor.fromJson(x)));

String tutorToJson(List<Tutor> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tutor {
    Tutor({
        required this.idTutor,
        required this.functionTutor,
    });

    int idTutor;
    String functionTutor;

    factory Tutor.fromJson(Map<String, dynamic> json) => Tutor(
        idTutor: json["idTutor"],
        functionTutor: json["functionTutor"],
    );

    Map<String, dynamic> toJson() => {
        "idTutor": idTutor,
        "functionTutor": functionTutor,
    };
}
