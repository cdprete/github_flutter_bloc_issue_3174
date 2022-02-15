import 'dart:async';

class ItemRepository {
  ItemRepository() : data = [];

  final List<Item> data;

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
  Item(this.value);

  final String value;

  @override
  String toString() => value;
}
