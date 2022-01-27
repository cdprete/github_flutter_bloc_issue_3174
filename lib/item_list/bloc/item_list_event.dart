part of 'item_list_bloc.dart';

@immutable
abstract class ItemListEvent {
  const ItemListEvent();
}

class FetchItemList extends ItemListEvent {}
