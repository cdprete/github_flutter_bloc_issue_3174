import 'package:bloc/bloc.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';
import 'package:github_flutter_bloc_issue_3174/main.dart';
import 'package:meta/meta.dart';

part 'item_list_event.dart';
part 'item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  final ItemRepository _repository;

  ItemListBloc()
      : _repository = repository,
        super(ItemListInitial()) {
    on<FetchItemList>(_onFetchItemList);
  }

  void fetchItemList() {
    add(FetchItemList());
  }

  void _onFetchItemList(
    FetchItemList event,
    Emitter<ItemListState> emit,
  ) async {
    emit(FetchingItemList());
    final items = await _repository.getAllItems();
    emit(ItemListFetched(items));
  }
}
