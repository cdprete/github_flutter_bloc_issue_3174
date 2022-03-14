part of 'item_list_bloc.dart';

@immutable
class ItemListState {
  const ItemListState({this.items = const []});

  final List<Item> items;
}
