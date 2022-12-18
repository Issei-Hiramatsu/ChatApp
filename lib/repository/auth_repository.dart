import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chatapp/repository/general_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class BaseAuthRepository {
  Stream<User?> get authStateChanges; //ユーザ情報を取得する
  Future<void> signInAnonymously(); //ログに残す
  User? getCurrentUser(); //現在サインインしているユーザ
  Future<void> signOut(); //サインアウト
}

class AuthRepository implements BaseAuthRepository {
  final Ref _read; //データの取得＆更新よう　元がReaderなどで若干変わるかも?

  const AuthRepository(this._read);

  @override
  Stream<User?> get authStateChanges =>
      _read.read(firebaseAuthProvider).authStateChanges();

  @override
  Future<void> signInAnonymously() async {
    await _read.read(firebaseAuthProvider).signInAnonymously();
  }

  @override
  User? getCurrentUser() {
    return _read.read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> signOut() async {
    await _read.read(firebaseAuthProvider).signOut();
    await signInAnonymously();
  }
}
