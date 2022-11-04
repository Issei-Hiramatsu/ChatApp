import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'message_bubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'createdAt',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final chatDocs = chatSnapshot.data?.docs;
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((ctx, futureSnapshot) {
            if (futureSnapshot.connectionState == ConnectionState.waiting) {
              return (const Center(
                child: CircularProgressIndicator(),
              ));
            }
            return ListView.builder(
              reverse: true,
              itemCount: chatSnapshot.data?.docs.length,
              itemBuilder: (context, index) => MessageBubble(
                chatDocs?[index]['text'],
                chatDocs?[index]['username'],
                chatDocs?[index]['userImage'],
                chatDocs?[index]['userId'] == futureSnapshot.data!.uid,
                key: ValueKey(chatDocs![index].id),
              ),
            );
          }),
        );
      },
    );
  }
}