import 'package:flutter/material.dart';
import 'package:flutter_chatapp/view/token/color_screm.dart';

import '../atom/logout.dart';
import '../molecule/message_bubble.dart';
import '../molecule/send_message_field.dart';
import '../organism/user_message_bubble.dart';

class ChatTemplate extends StatelessWidget {
  const ChatTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Chat'),
        backgroundColor: colorScheme.primary,
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
