import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_chatapp/view/page/chat_page.dart';
import 'package:flutter_chatapp/view/template/chat_scrren.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'view/page/template_chat_page.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(brightness: Brightness.light),

      home: const CounterApp(),
      //  StreamBuilder(
      //   stream: FirebaseAuth.instance.authStateChanges(),
      //   builder: ((context, userSnapshot) {
      //     if (userSnapshot.hasData) {
      //       return const ChatScreen();
      //     }
      //     return const AuthScreen();
      //   }),
      // ),
    );
  }
}
