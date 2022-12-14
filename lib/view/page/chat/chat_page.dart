import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../use_case/model/user_model.dart';
import '../../../use_case/state/change_login_state.dart';
import '../../atom/logout.dart';
import '../../molecule/send_message_field.dart';
import '../../organism/user_message_bubble.dart';
import '../../token/color_screm.dart';

//ここに初期のログイン情報があると仮定する

final userModelProvider = ChangeNotifierProvider<UserNotifier>((ref) {
  return UserNotifier();
});

class ChatPage extends HookConsumerWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<UserModel> userList = ref.watch(userModelProvider).userModel;

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Chat'),
            // leading: IconButton(
            //   icon: const Icon(Icons.settings),
            //   onPressed: () => ,
            // ),
            backgroundColor: colorScheme.primary,
            actions: [
              LogOutBottomDropDownButton(),
            ],
          ),
          //コミット＆間違えていた箇所をまとめる　そしたら東西線に乗る
          body: Column(
            children: [
              Center(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  children: [
                    for (UserModel user in userList)
                      UserMessageBubble(isMe: user.isMe),
                  ],
                ),
              ),
              UserMessageBubble(isMe: true),
              SendMessageField(
                onPressed: () {},
              ),
            ],
          )),
    );
  }
}
