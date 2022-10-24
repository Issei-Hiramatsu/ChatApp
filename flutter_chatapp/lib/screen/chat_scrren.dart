import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats/VIOLe3yq6kEhSaSaSwd6/messages')
            .snapshots(),
        builder: (ctx, streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data?.docs;
          return ListView.builder(
            itemCount: streamSnapshot.data?.docs.length,
            itemBuilder: ((ctx, index) => Container(
                  padding: EdgeInsets.all(8),
                  child: Text(documents?[index]['text']),
                )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          FirebaseFirestore.instance
              .collection('chats/VIOLe3yq6kEhSaSaSwd6/messages')
              .add({'text': 'This was added by clocking the button!'});
        },
      ),
    );
  }
}
