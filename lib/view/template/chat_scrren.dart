import 'package:flutter/material.dart';

import '../atom/logout.dart';
import '../moleure/message_bubble.dart';

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
        ],
      ),
    );
  }
}
