import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class ChatScreen extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _database = FirebaseDatabase.instance.ref();
  late TextEditingController _messageController;
  List<String> messages = [];

  @override
  void initState() {
    _messageController = TextEditingController();

    super.initState();
    _loadMessages();
  }

  void _loadMessages() {
    _database.child('chat').onChildAdded.listen((event) {
      setState(() {
        messages.add(event.snapshot.value as String);
      });
    });
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      String fullMessage = message;
      _database.child('chat').push().set(fullMessage);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat em Tempo Real'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Digite uma mensagem...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    _sendMessage(_messageController.text);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
