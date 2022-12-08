import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../atom/logout.dart';
import '../moleure/message_bubble.dart';
import '../moleure/send_message_field.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        actions: [
          LogOutBottomDropDownButton(),
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
