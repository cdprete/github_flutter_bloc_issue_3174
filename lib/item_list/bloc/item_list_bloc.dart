import 'package:bloc/bloc.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';

import 'package:meta/meta.dart';

part 'item_list_event.dart';
part 'item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  ItemListBloc({
    required ItemRepository itemRepository,
  })  : _itemRepository = itemRepository,
        super(ItemListInitial()) {
    on<FetchItemList>(_onFetchItemList);
    on<AddNewItem>(_onAddNewItem);
  }

  final ItemRepository _itemRepository;

  void _onFetchItemList(
    FetchItemList event,
    Emitter<ItemListState> emit,
  ) async {
    emit(FetchingItemList());
    final items = await _itemRepository.getAllItems();
    emit(ItemListFetched(items));
  }

  void _onAddNewItem(AddNewItem event, Emitter<ItemListState> emit) async {
    final newItem = await _itemRepository.addItem(event.toAdd);
    final items = state is ItemListStateWithData
        ? [...(state as ItemListStateWithData).items, newItem]
        : [newItem];

    emit(ItemListFetched(items));
  }
}
