part of 'add_item_bloc.dart';

@immutable
abstract class AddItemState {
  const AddItemState();
}

class AddItemInitial extends AddItemState {
  const AddItemInitial();
}

class AddItemSuccess extends AddItemState {
  const AddItemSuccess(this.item);

  final Item item;
}
