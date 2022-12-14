import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class TodosNotifier extends ChangeNotifier {
  final todos = <Todo>[
    Todo(id: '1', description: 'テスト', completed: true),
  ];

  // UI 側から Todo アイテムを追加できるようにする
  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  // Todo アイテムの削除
  void removeTodo(String todoId) {
    todos.remove(todos.firstWhere((element) => element.id == todoId));
    notifyListeners();
  }

  // Todo の完了ステータスの変更
  void toggle(String todoId) {
    for (final todo in todos) {
      if (todo.id == todoId) {
        todo.completed = !todo.completed;
        notifyListeners();
      }
    }
  }
}
