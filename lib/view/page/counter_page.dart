import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../use_case/state/counter.dart';

//ここでproviderを呼び出す
final counterProvider = StateNotifierProvider((_) => Counter());

class CounterApp extends HookConsumerWidget {
  const CounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //ここで常に監視していることを宣言　値が変われば他の値も変わる
    final state = ref.watch(counterProvider);
    //これはhooks　このクラスのみで使用される　値を変化したいものを中に入れる
    final isWhiteBackGround = useState(true);

    return MaterialApp(
      home: Scaffold(
        backgroundColor: isWhiteBackGround.value ? Colors.white : Colors.black,
        appBar: AppBar(
          title: const Text('CounterApp'),
          leading: IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => isWhiteBackGround.value = !isWhiteBackGround.value,
          ),
        ),
        body: Center(
          child: Text(
            state.toString(),
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: isWhiteBackGround.value ? Colors.black : Colors.white),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => ref.read(counterProvider.notifier).increment(),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
