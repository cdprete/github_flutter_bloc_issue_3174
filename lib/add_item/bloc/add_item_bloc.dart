import 'package:bloc/bloc.dart';
import 'package:github_flutter_bloc_issue_3174/infrastracture/item_repository.dart';
import 'package:github_flutter_bloc_issue_3174/main.dart';
import 'package:meta/meta.dart';

part 'add_item_event.dart';
part 'add_item_state.dart';

class AddItemBloc extends Bloc<AddItemEvent, AddItemState> {
  // This would be injected by GetIt
  final ItemRepository _repository;

  AddItemBloc()
      : _repository = repository,
        super(AddItemInitial()) {
    on<AddNewItem>(_onAddNewItem);
  }

  void addNewItem(Item toAdd) => add(AddNewItem(toAdd));

  void _onAddNewItem(AddNewItem event, Emitter<AddItemState> emit) async {
    final newItem = await _repository.addItem(event.toAdd);
    emit(NewItemAdded(newItem));
  }
}
