import 'dart:async';

class ItemRepository {
  final List<Item> data;

  ItemRepository() : data = [];

  FutureOr<Item> addItem(Item item) async {
    data.add(item);

    // This would be the added value (with a resolved ID for example)
    return item;
  }

  // This is actually paged in the real app
  FutureOr<List<Item>> getAllItems() async {
    return data;
  }
}

class Item {
  final String value;
  Item(this.value);

  @override
  String toString() => value;
}
