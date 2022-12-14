import 'package:flutter/material.dart';
import 'package:flutter_chatapp/view/molecule/message_bubble.dart';
import 'package:flutter_chatapp/view/token/color_screm.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserMessageBubble extends HookConsumerWidget {
  UserMessageBubble({
    required this.isMe,
  });

  final bool isMe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      backgroundColor: isMe ? colorScheme.secondary : colorScheme.surface,
      textColor: isMe ? colorScheme.onPrimary : colorScheme.onBackground,
      message: '図書館で作業中',
      userName: 'Issei',
    );
  }
}
