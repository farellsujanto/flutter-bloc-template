import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth.dart';
import 'blocs/todos/todos.dart';
import 'blocs/bloc_delegate.dart';
import 'app.dart';

import 'repositories/firebase_auth_repository.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final FirebaseAuthRepository firebaseAuthRepository =
      FirebaseAuthRepository();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<TodosBloc>(
          create: (context) => TodosBloc()..add(TodosLoaded()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => AuthBloc(
            firebaseAuthRepository: firebaseAuthRepository,
          )..add(AuthInitialize()),
        ),
      ],
      child: App(),
    ),
  );
}
