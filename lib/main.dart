import 'package:flutter/material.dart';
import 'package:github_flutter_bloc_issue_3174/add_item/add_item_dialog.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';
import 'package:github_flutter_bloc_issue_3174/item_list/item_list.dart';

// This will be injected by GetIt as singleton
final repository = ItemRepository();

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Bloc GitHub issue #3174 demo'),
      ),
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => setState(() {
          currentIndex = index;
        }),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Empty #1",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Empty #2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.schedule),
            label: "Here please",
          )
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  FloatingActionButton? get floatingActionButton => currentIndex == 2
      ? FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => const AddItemDialog(),
          ),
        )
      : null;

  Widget get body => currentIndex == 2 ? const ItemList() : const Placeholder();
}
