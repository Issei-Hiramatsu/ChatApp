// import 'package:flutter/material.dart';

// import '../model/user_model.dart';

// class UserNotifier extends ChangeNotifier {
//   final List<UserModel> _userModel = [
//     UserModel(isMe: true, userName: 'Issei', message: 'Hi'),
//     UserModel(isMe: true, userName: 'Issei', message: 'Yay'),
//     UserModel(isMe: false, userName: 'Rummy', message: 'Cya!'),
//   ];

//  List<UserModel> get items {
//     return [..._userModel];
//   }
//   // UserModel の完了ステータスの変更
//   void changeLoginUser() {
//     _userModel.
//      = !isMe;
//     notifyListeners();
//   }
// }

import 'package:hooks_riverpod/hooks_riverpod.dart';

class Background extends StateNotifier<bool> {
  Background() : super(true);
  void changeBackground(isMe) => isMe = !isMe;
}
