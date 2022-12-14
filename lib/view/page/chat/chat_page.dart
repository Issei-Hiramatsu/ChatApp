import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../use_case/model/user_model.dart';
import '../../atom/logout.dart';
import '../../molecule/send_message_field.dart';
import '../../organism/user_message_bubble.dart';
import '../../token/color_screm.dart';

//ここに初期のログイン情報があると仮定する
final isMeProvider = ChangeNotifierProvider((ref) => LoginState());

class ChatPage extends HookConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMe = ref.watch(isMeProvider);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: isMe ? Colors.white : Colors.black,
        appBar: AppBar(
          title: const Text('Flutter Chat'),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => ,
          ),
          backgroundColor: colorScheme.primary,
          actions: [
            LogOutBottomDropDownButton(),
          ],
        ),
        body: Column(
          children: [
            UserMessageBubble(isMe: isMe),
            UserMessageBubble(isMe: isMe),
            UserMessageBubble(isMe: isMe),
            const Spacer(),
            SendMessageField(
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
