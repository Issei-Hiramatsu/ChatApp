import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'screen/auth_screen.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print('Have error');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSwatch(
      //     primarySwatch: Colors.pink,
      //   ).copyWith(
      //     secondary: Colors.purple,
      //     brightness: Brightness.dark,
      //   ),
      //   backgroundColor: Colors.pink,
      //   buttonTheme: ButtonTheme.of(context).copyWith(
      //     buttonColor: Colors.pink,
      //     textTheme: ButtonTextTheme.primary,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(20),
      //     ),
      //   ),
      // ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.green,
        ),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.purple)),
      ),
      home: AuthScreen(),
    );
  }
}
