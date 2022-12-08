import 'package:flutter/material.dart';

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
            color: Theme.of(context).primaryColor,
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
