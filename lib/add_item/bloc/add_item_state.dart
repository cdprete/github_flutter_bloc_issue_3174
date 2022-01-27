part of 'add_item_bloc.dart';

@immutable
abstract class AddItemState {
  const AddItemState();
}

class AddItemInitial extends AddItemState {}

class NewItemAdded extends AddItemState {
  final Item addedItem;
  const NewItemAdded(this.addedItem);
}
