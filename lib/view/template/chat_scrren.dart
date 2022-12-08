import 'package:flutter/material.dart';

import '../atom/logout.dart';
import '../molecule/message_bubble.dart';
import '../molecule/send_message_field.dart';

class ChatTemplate extends StatelessWidget {
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
          MessageBubble(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            messageTextAlign: TextAlign.start,
            backgroundColor: Colors.purple,
            textColor: Colors.white,
            message: '図書館で作業中',
            userName: 'Issei',
          ),
          MessageBubble(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            messageTextAlign: TextAlign.start,
            backgroundColor: Colors.purple,
            textColor: Colors.white,
            message: '図書館で作業中',
            userName: 'Issei',
          ),
          MessageBubble(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            messageTextAlign: TextAlign.start,
            backgroundColor: Colors.purple,
            textColor: Colors.white,
            message: '図書館で作業中',
            userName: 'Issei',
          ),
          const Spacer(),
          SendMessageField(
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
