import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../use_case/state/change_login_state.dart';
import '../../atom/logout.dart';
import '../../molecule/send_message_field.dart';
import '../../organism/user_message_bubble.dart';

//ここに初期のログイン情報があると仮定する

// final userModelProvider = ChangeNotifierProvider<UserNotifier>((ref) {
//   return UserNotifier();
// });

final backgroundProvider = StateNotifierProvider((_) => Background());

class ChatPage extends HookConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundState = ref.watch(backgroundProvider);
    final isMe = true;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Chat'),
            // leading: IconButton(
            //   icon: const Icon(Icons.settings),
            //   onPressed: () => ,
            // ),
            actions: [
              LogOutBottomDropDownButton(),
            ],
          ),
          body: Column(
            children: [
              Center(
                // child: ListView(
                //   scrollDirection: Axis.vertical,
                //   shrinkWrap: true,
                //   children: [
                //     for (UserModel user in userList)
                //       UserMessageBubble(
                //         isMe: user.isMe,
                //         userName: user.userName,
                //         message: user.message,
                //       ),
                //   ],
                // ),
                child: UserMessageBubble(
                  isMe: isMe,
                ),
              ),
              SendMessageField(
                onPressed: () => ref
                    .read(backgroundProvider.notifier)
                    .changeBackground(isMe),
              ),
            ],
          )),
    );
  }
}
