import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String teacherId;

  ChatScreen({required this.teacherId});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  final List<String> _messages = [];

  void _handleSubmitted(String text) {
    _textEditingController.clear();
    setState(() {
      _messages.insert(0, text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: Text('Chat avec le professeur'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final String message = _messages[index];

                return ListTile(
                  title: Text(message),
                );
              },
              reverse: true,
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    controller: _textEditingController,
                    onSubmitted: _handleSubmitted,
                    decoration: InputDecoration.collapsed(hintText: 'Écrire un message'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textEditingController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
