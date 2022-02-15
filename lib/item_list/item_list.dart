import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc_issue_3174/item_list/bloc/item_list_bloc.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemListBloc, ItemListState>(
      builder: (context, state) {
        if (state is FetchingItemList) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ItemListFetched) {
          final items = state.items;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (_, index) => Padding(
              child: Text(items[index].value),
              padding: const EdgeInsets.symmetric(vertical: 5),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
