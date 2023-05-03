import 'package:flutter/material.dart';
import 'api.dart';

class View_Models extends StatefulWidget {
  const View_Models({super.key});

  @override
  State<View_Models> createState() => _View_ModelsState();
}

class _View_ModelsState extends State<View_Models> {

  List<dynamic> _myModels = [];

  @override
  void initState() {
    super.initState();
    MyApi.getMyModels().then((models) {
      setState(() {
        _myModels = models;
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
        itemCount: _myModels.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_myModels[index]['name']),
            subtitle: Text(_myModels[index]['description']),
          );
        },
      ),
    );
  }
}
