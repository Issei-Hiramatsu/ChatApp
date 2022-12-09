import 'package:flutter/material.dart';
import 'package:flutter_chatapp/view/molecule/message_bubble.dart';

class UserMessageBubble extends StatelessWidget {
  UserMessageBubble(
    this.isMe,
  );

  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return MessageBubble(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      crossAxisAlignment:
          isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      messageTextAlign: isMe ? TextAlign.end : TextAlign.start,
      borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(12),
        topRight: const Radius.circular(12),
        bottomLeft:
            !isMe ? const Radius.circular(0) : const Radius.circular(12),
        bottomRight:
            isMe ? const Radius.circular(0) : const Radius.circular(12),
      ),
      backgroundColor: isMe ? Colors.purple : Colors.grey,
      textColor: isMe ? Colors.white : Colors.black,
      message: '図書館で作業中',
      userName: 'Issei',
    );
  }
}
