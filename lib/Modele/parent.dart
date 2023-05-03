import 'dart:convert';

List<Parent> parentFromJson(String str) => List<Parent>.from(json.decode(str).map((x) => Parent.fromJson(x)));

String parentToJson(List<Parent> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Parent {
    Parent({
        required this.idParent,
        required this.functionParent,
        required this.identificationNumber,
    });

    int idParent;
    String functionParent;
    int identificationNumber;

    factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        idParent: json["idParent"] ?? 0,
        functionParent: json["functionParent"],
        identificationNumber: json["identificationNumber"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "idParent": idParent.toInt() ,
        "functionParent": functionParent,
        "identificationNumber": identificationNumber,
    };
}
