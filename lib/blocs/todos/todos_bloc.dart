import 'package:bloc/bloc.dart';
import 'todos.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  @override
  TodosState get initialState => TodosLoadInProgress();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoaded) {
      yield* _mapTodosLoadedToState();
    }
    if (event is TodosAdded) {
      yield* _mapTodosAddedToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadedToState() async* {
    const List<TodosModel> list = [];
    yield TodosLoadSuccess(list);
  }

  Stream<TodosState> _mapTodosAddedToState(TodosAdded event) async* {
    final currentState = state;
    if (currentState is TodosLoadSuccess) {
      List<TodosModel> newList = [];
      newList.addAll(currentState.todos);
      newList.add(event.todo);
      yield TodosLoadSuccess(newList);
    }

  }

}