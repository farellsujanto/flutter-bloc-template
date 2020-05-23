import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_normal_test/blocs/register/register_bloc.dart';
import 'package:todos_normal_test/repositories/firebase_auth_repository.dart';

import 'register_body.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<RegisterBloc>(
        create: (context) => RegisterBloc(
          firebaseAuthRepository:
              RepositoryProvider.of<FirebaseAuthRepository>(context),
        ),
        child: RegisterBody(),
      ),
    );
  }
}
