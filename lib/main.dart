import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc_issue_3174/add_item/add_item_dialog.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';
import 'package:github_flutter_bloc_issue_3174/item_list/item_list.dart';

import 'item_list/bloc/item_list_bloc.dart';

void main() {
  final itemRepository = ItemRepository();
  runApp(MyApp(itemRepository: itemRepository));
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required ItemRepository itemRepository,
  })  : _itemRepository = itemRepository,
        super(key: key);

  final ItemRepository _itemRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _itemRepository,
      child: BlocProvider(
        create: (_) => ItemListBloc(
          itemRepository: _itemRepository,
        ),
        child: const MaterialApp(
          home: MyAppView(),
        ),
      ),
    );
  }
}

class MyAppView extends StatefulWidget {
  const MyAppView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  int currentIndex = 1;

  Widget get body => currentIndex == 2 ? const ItemList() : const Placeholder();

  FloatingActionButton? get floatingActionButton {
    if (currentIndex == 2) {
      return FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const AddItemDialog(),
        ),
      );
    }
  }

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
}
