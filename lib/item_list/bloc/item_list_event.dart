part of 'item_list_bloc.dart';

@immutable
abstract class ItemListEvent {
  const ItemListEvent();
}

class ItemListChanged extends ItemListEvent {
  const ItemListChanged({required this.items});
  final List<Item> items;
}
