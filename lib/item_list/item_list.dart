import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_flutter_bloc_issue_3174/item_list/bloc/item_list_bloc.dart';

class ItemList extends StatelessWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ItemListBloc(),
      child: BlocBuilder<ItemListBloc, ItemListState>(
        builder: (context, state) {
          if (state is ItemListInitial) {
            // Very ugly but it works.
            // BlocConsumer doesn't trigger the listener with the initial state which is what I was expecting
            context.read<ItemListBloc>().fetchItemList();
            return const SizedBox.shrink();
          } else if (state is FetchingItemList) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final items = (state as ItemListStateWithData).items;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (_, index) => Padding(
                child: Text(items[index].value),
                padding: const EdgeInsets.symmetric(vertical: 5),
              ),
            );
          }
        },
      ),
    );
  }
}
