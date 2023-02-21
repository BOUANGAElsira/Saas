import 'package:flutter/material.dart';
import 'Person.dart';
import 'dart:typed_data';


class Student extends Person {
  final String identificationNumber;
  final bool abandon;


  Student({
    required this.identificationNumber,
    required this.abandon,
    required int idPerson,
    required String name,
    required String firstName,
    required String email,
    required String mobilPhone,
    required String fixedPhone,
    required String address,
    //required Blob CNI
  }) : super(
      idPerson: idPerson,
      name: name,
      firstName: firstName,
      email: email,
      mobilPhone: mobilPhone,
      fixedPhone: fixedPhone,
      address: address,
      //CNI: CNI,
  );
}

class StudentInfoService {
  static Future<Student> getStudentInfo(String studentId) async {
    // Remplacer ce code par la requête de base de données réelle pour obtenir les informations de l'étudiant
    await Future.delayed(Duration(seconds: 1));
    Uint8List binaryData = Uint8List.fromList([0x01, 0x02, 0x03]);
    return Student(
      identificationNumber: studentId,
      idPerson: 1,
      name: 'Ema',
      firstName: 'Elsira',
      abandon: false,
      email: 'emaelsira12@gmail.com',
      mobilPhone: '068497458',
      fixedPhone: '055985247',
      address: '134 Sonogolo vers la résidence Cardorelle',
      //CNI: binaryData,
    );
  }
}

class StudentInfoView extends StatefulWidget {
  final String studentId;

  StudentInfoView({required this.studentId});

  @override
  _StudentInfoViewState createState() => _StudentInfoViewState();
}

class _StudentInfoViewState extends State<StudentInfoView> {
  Student? _student;

  @override
  void initState() {
    super.initState();
    // Obtenir les informations de l'étudiant à partir de la base de données
    StudentInfoService.getStudentInfo(widget.studentId).then((student) {
      setState(() {
        _student = student;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Informations de l\'étudiant'),
        backgroundColor: Colors.brown,
      ),
      body: _student == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nom complet: ${_student!.firstName} ${_student!.name}\n'),
            Text('Status: ${_student!.abandon}\n'),
            Text('Adresse e-mail: ${_student!.email}\n'),
            Text('Numéro de téléphone mobile: ${_student!.mobilPhone}\n'),
            Text('Numéro de téléphone fixe: ${_student!.firstName}\n'),
            Text('Adresse: ${_student!.address}\n'),
          ],
        ),
      ),
    );
  }
}

