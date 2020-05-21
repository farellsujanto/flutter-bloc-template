import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_normal_test/blocs/login/login.dart';
import 'package:todos_normal_test/repositories/firebase_auth_repository.dart';

import 'login_body.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(
          firebaseAuthRepository:
              RepositoryProvider.of<FirebaseAuthRepository>(context),
        ),
        child: LoginBody(),
      ),
    );
  }
}
