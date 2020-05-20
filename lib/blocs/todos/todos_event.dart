import 'package:equatable/equatable.dart';
import 'todos.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosEvent {}

class TodosAdded extends TodosEvent {
  final TodosModel todo;

  const TodosAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { $todo }';
}