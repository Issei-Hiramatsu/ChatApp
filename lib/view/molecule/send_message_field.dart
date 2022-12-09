import 'package:flutter/material.dart';
import 'package:flutter_chatapp/view/token/color_screm.dart';

class SendMessageField extends StatelessWidget {
  SendMessageField({
    required this.onPressed,
  });
  final Function onPressed;

  //final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          const Expanded(
            child: TextField(
              //controller: _controller,
              decoration: InputDecoration(labelText: '送信'),
            ),
          ),
          IconButton(
            color: colorScheme.primary,
            icon: const Icon(Icons.send),
            onPressed: () {
              onPressed;
            },
          )
        ],
      ),
    );
  }
}
