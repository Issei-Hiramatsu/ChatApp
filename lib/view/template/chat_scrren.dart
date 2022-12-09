import 'package:flutter/material.dart';

import '../atom/logout.dart';
import '../molecule/message_bubble.dart';
import '../molecule/send_message_field.dart';
import '../organism/tmp_message_bubble.dart';

class ChatTemplate extends StatelessWidget {
  const ChatTemplate({super.key});

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
        children: [
          UserMessageBubble(false),
          UserMessageBubble(false),
          UserMessageBubble(true),
          const Spacer(),
          SendMessageField(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
