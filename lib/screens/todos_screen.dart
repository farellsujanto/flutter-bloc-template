import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/todos/todos.dart';

class TodosScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("TEST"),
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Expanded(
            child: RaisedButton(
              child: Text("BACK"),
              onPressed: () {
                Navigator.of(context).pushNamed('/main', arguments: "TEST");
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<TodosBloc, TodosState>(
              builder: (context, state) {
                if (state is TodosLoadInProgress) {
                  return Text("LOADING");
                }
                if (state is TodosLoadSuccess) {
                  return ListView(
                      children: state.todos.map((val) {
                    return Text(val.name);
                  }).toList());
                }
              },
            ),
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todosBloc.add(TodosAdded(TodosModel('test')));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
