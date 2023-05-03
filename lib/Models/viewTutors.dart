/* import 'package:flutter/material.dart';
import 'api.dart';

class viewTutor extends StatefulWidget {
  const viewTutor({super.key});

  @override
  State<viewTutor> createState() => _viewTutorState();
}

class _viewTutorState extends State<viewTutor> {

  List<dynamic> _tutor = [];

  @override
  void initState() {
    super.initState();
    MyApi().getTutor().then((tutor) {
      setState(() {
        _tutor = tutor;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Models'),
        backgroundColor: Colors.brown,
      ),
      body: ListView.builder(
        itemCount: _tutor.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_tutor[index]['functionTutor']),
          );
        },
      ),
    );
  }
} */
