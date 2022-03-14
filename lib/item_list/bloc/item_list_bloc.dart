import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';
import 'package:meta/meta.dart';

part 'item_list_event.dart';
part 'item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  ItemListBloc(ItemRepository repository) : super(const ItemListState()) {
    on<ItemListChanged>(_onItemListChanged);
    _subscription = repository.items.listen(
      (items) => add(ItemListChanged(items: items)),
    );
  }

  late StreamSubscription<List<Item>> _subscription;

  void _onItemListChanged(ItemListChanged event, Emitter<ItemListState> emit) {
    emit(ItemListState(items: event.items));
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    return super.close();
  }
}
