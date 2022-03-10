import 'dart:async';

class ItemRepository {
  final _controller = StreamController<List<Item>>.broadcast();
  final List<Item> _data = [];

  void addItem(Item item) async {
    _data.add(item);
    _controller.add(_data);
  }

  Stream<List<Item>> get items => _controller.stream;
}

class Item {
  final String value;
  Item(this.value);

  @override
  String toString() => value;
}
