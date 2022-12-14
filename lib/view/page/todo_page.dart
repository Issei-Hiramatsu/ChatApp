import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../use_case/model/todo_model.dart';
import '../../use_case/state/todo_state.dart';

// 最後に ChangeNotifierProvider を通じて UI 側から
// TodosNotifier を監視・操作できるようにする
final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});

class TodoListViewPage extends ConsumerWidget {
  const TodoListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Todo リストの内容に変更があればウィジェットを再構築
    List<Todo> todos = ref.watch(todosProvider).todos;

    // スクロール可能な ListView で Todo リストを表示
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CounterApp'),
        ),
        body: Center(
            child: ListView(
          children: [
            for (final todo in todos)
              CheckboxListTile(
                value: todo.completed,
                // Todo をタップして完了ステータスを変更
                onChanged: (value) =>
                    ref.read(todosProvider.notifier).toggle(todo.id),
                title: Text(todo.description),
              ),
          ],
        )),
      ),
    );
  }
}
