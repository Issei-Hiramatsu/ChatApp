import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: ((ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text('Test'),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/VIOLe3yq6kEhSaSaSwd6/messages')
              .snapshots()
              .listen((data) {
            print(data);
          });
        },
      ),
    );
  }
}
