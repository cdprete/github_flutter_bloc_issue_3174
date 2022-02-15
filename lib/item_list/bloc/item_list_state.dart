part of 'item_list_bloc.dart';

@immutable
abstract class ItemListState {
  const ItemListState();
}

class FetchingItemList extends ItemListState {}

abstract class ItemListStateWithData extends ItemListState {
  const ItemListStateWithData({required this.items});

  final List<Item> items;
}

class ItemListInitial extends ItemListStateWithData {
  const ItemListInitial() : super(items: const []);
}

class ItemListFetched extends ItemListStateWithData {
  const ItemListFetched(List<Item> items) : super(items: items);
}
