part of 'item_list_bloc.dart';

@immutable
abstract class ItemListState {
  const ItemListState();
}

abstract class ItemListStateWithData extends ItemListState {
  final List<Item> items;
  const ItemListStateWithData(this.items);
}

class ItemListInitial extends ItemListStateWithData {
  ItemListInitial() : super([]);
}

class FetchingItemList extends ItemListState {}

class ItemListFetched extends ItemListStateWithData {
  const ItemListFetched(List<Item> items) : super(items);
}
