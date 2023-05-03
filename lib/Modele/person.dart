import 'dart:convert';

List<Person> personFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  String name;
  String firstname;
  String email;
  String mobilPhone;
  String fixedPhone;
  String address;
  String CNI;
  String photo;
  String type;

  Person({
    required this.name,
    required this.firstname,
    required this.email,
    required this.mobilPhone,
    required this.fixedPhone,
    required this.address,
    required this.CNI,
    required this.photo,
    required this.type,
  });

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      name: json['name'],
      firstname: json['firstname'],
      email: json['email'],
      mobilPhone: json['mobilPhone'],
      fixedPhone: json['fixedPhone'],
      address: json['address'],
      CNI: json['CNI'],
      photo: json['photo'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'firstname': firstname,
      'email': email,
      'mobilPhone': mobilPhone,
      'fixedPhone': fixedPhone,
      'address': address,
      'CNI': CNI,
      'photo': photo,
      'type': type,
    };
  }
}
