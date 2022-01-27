part of 'add_item_bloc.dart';

@immutable
abstract class AddItemEvent {
  const AddItemEvent();
}

class AddNewItem extends AddItemEvent {
  final Item toAdd;

  const AddNewItem(this.toAdd);
}
