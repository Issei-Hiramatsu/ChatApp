import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'domain/item_model/item_model.dart';
import 'repository/custom_exception.dart';
import 'use_case/auth_controller.dart';
import 'use_case/item_list_controller.dart';

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

      home: HomeScreen(),
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

final authControllerProvider = StateNotifierProvider(
  (ref) => AuthController(ref)..appStarted(),
);

class HomeScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authControllerState = ref.watch(authControllerProvider);
    ref.listen(itemListExceptionProvider, (prev, next) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(backgroundColor: Colors.red, content: Text('a')));
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
        leading: authControllerState != null
            ? IconButton(
                //関数を使用したい場合はnotifierを使用する
                onPressed: () =>
                    ref.read(authControllerProvider.notifier).signOut(),
                icon: const Icon(Icons.logout),
              )
            : null,
      ),
      body: ItemList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AddItemDialog.show(context, Item.empty()),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AddItemDialog extends HookConsumerWidget {
  static void show(BuildContext context, Item item) {
    showDialog(
      context: context,
      builder: (context) => AddItemDialog(item: item),
    );
  }

  final Item item;

  const AddItemDialog({Key? key, required this.item}) : super(key: key);

  bool get isUpdating => item.id != null;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = TextEditingController(text: item.name);
    return Dialog(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: textController,
              autofocus: true,
              decoration: InputDecoration(hintText: 'Item name'),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: isUpdating
                        ? Colors.orange
                        : Theme.of(context).primaryColor),
                onPressed: () {
                  isUpdating
                      ? ref
                          .read(itemListControllerProvider.notifier)
                          .updateItem(
                            updatedItem: item.copyWith(
                              name: textController.text.trim(),
                              obtained: item.obtained,
                            ),
                          )
                      : ref
                          .read(itemListControllerProvider.notifier)
                          .addItem(name: textController.text.trim());
                  Navigator.of(context).pop();
                },
                child: Text(isUpdating ? 'Update' : 'Add'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

final currentItem = Provider<Item>(((_) => throw UnimplementedError()));

class ItemList extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemListState = ref.watch(itemListControllerProvider.notifier).state;
    //final filteredItemList = ref.watch(filteredItemListProvider);
    return itemListState.when(
      data: (items) => items.isEmpty
          ? const Center(
              child: Text(
                'Tap + to add an item',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          : ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return ProviderScope(
                  overrides: [currentItem.overrideWithValue(item)],
                  child: const ItemTile(),
                );
              },
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => ItemListError(
        message:
            error is CustomException ? error.message! : 'Something went wrong!',
      ),
    );
  }
}

class ItemTile extends HookConsumerWidget {
  const ItemTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItem);
    return ListTile(
      key: ValueKey(item.id),
      title: Text(item.name),
      trailing: Checkbox(
        value: item.obtained,
        onChanged: (val) => ref
            .read(itemListControllerProvider.notifier)
            .updateItem(updatedItem: item.copyWith(obtained: !item.obtained)),
      ),
      onTap: () => AddItemDialog.show(context, item),
      onLongPress: () => ref
          .read(itemListControllerProvider.notifier)
          .deleteItem(itemId: item.id!),
    );
  }
}

class ItemListError extends ConsumerWidget {
  final String message;

  const ItemListError({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message, style: const TextStyle(fontSize: 20.0)),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () => ref
                .read(itemListControllerProvider.notifier)
                .retrieveItems(isRefreshing: true),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
