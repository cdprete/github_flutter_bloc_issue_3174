import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';
import 'package:github_flutter_bloc_issue_3174/item_list/bloc/item_list_bloc.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemListBloc(context.read<ItemRepository>()),
      child: const ItemsView(),
    );
  }
}

class ItemsView extends StatelessWidget {
  const ItemsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      builder: (context, state) {
        final items = state.items;
        return ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, index) => Padding(
            child: Text(items[index].value),
            padding: const EdgeInsets.symmetric(vertical: 5),
          ),
        );
      },
    );
  }
}
