import 'package:flutter/material.dart';
import 'package:flutter_chatapp/view/token/color_screm.dart';

class LogOutBottomDropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: Icon(
        Icons.more_vert,
        color: colorScheme.background,
      ),
      items: [
        DropdownMenuItem(
          value: 'logout',
          child: Row(
            children: const <Widget>[
              Icon(Icons.exit_to_app),
              SizedBox(width: 8),
              Text('Logout'),
            ],
          ),
        ),
      ],
      onChanged: (itemIdentifier) {
        // if (itemIdentifier == 'logout') {
        //   FirebaseAuth.instance.signOut();
        // }
      },
    );
  }
}
