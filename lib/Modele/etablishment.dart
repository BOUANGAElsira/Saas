import 'dart:convert';

List<Etablishment> etablishmentFromJson(String str) => List<Etablishment>.from(json.decode(str).map((x) => Etablishment.fromJson(x)));

String etablishmentToJson(List<Etablishment> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Etablishment {
    Etablishment({
        required this.acronym,
        required this.name,
        required this.type,
        required this.idSubscription,
        required this.idResponsable,
    });

    String acronym;
    String name;
    String type;
    int idSubscription;
    int idResponsable;

    factory Etablishment.fromJson(Map<String, dynamic> json) => Etablishment(
        acronym: json["acronym"],
        name: json["name"],
        type: json["type"],
        idSubscription: json["idSubscription"],
        idResponsable: json["idResponsable"],
    );

    Map<String, dynamic> toJson() => {
        "acronym": acronym,
        "name": name,
        "type": type,
        "idSubscription": idSubscription,
        "idResponsable": idResponsable,
    };
}
