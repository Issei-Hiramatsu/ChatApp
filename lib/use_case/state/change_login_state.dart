import 'package:flutter/material.dart';

import '../model/user_model.dart';

class UserNotifier extends ChangeNotifier {
  final userModel = <UserModel>[
    UserModel(isMe: true),
    UserModel(isMe: true),
    UserModel(isMe: true),
    UserModel(isMe: true),
  ];

  // UI 側から UserModel アイテムを追加できるようにする

  // UserModel の完了ステータスの変更
  void changeLoginUser(isMe) {
    isMe = !isMe;
    notifyListeners();
  }
}
