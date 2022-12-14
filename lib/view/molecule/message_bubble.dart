import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble(
      //this.userImage,
      {
    required this.mainAxisAlignment,
    required this.crossAxisAlignment,
    required this.messageTextAlign,
    required this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.message,
    required this.userName,
  });
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign messageTextAlign;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String message;
  final String userName;
  //final String userImage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: borderRadius,
                // borderRadius: BorderRadius.only(
                //   topLeft: const Radius.circular(12),
                //   topRight: const Radius.circular(12),
                //   bottomLeft: !isMe
                //       ? const Radius.circular(0)
                //       : const Radius.circular(12),
                //   bottomRight: isMe
                //       ? const Radius.circular(0)
                //       : const Radius.circular(12),
                // )
              ),
              width: 140,
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: const EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: crossAxisAlignment,
                children: [
                  Text(
                    userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                  Text(
                    message,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: messageTextAlign,
                  ),
                ],
              ),
            ),
          ],
        ),
        //???????????????Line????????????UI???????????????
        // Positioned(
        //   top: 0,
        //   left: isMe ? null : 120,
        //   right: isMe ? 120 : null,
        //   child: CircleAvatar(backgroundImage: NetworkImage(userImage)),
        // ),
      ],
    );
  }
}
