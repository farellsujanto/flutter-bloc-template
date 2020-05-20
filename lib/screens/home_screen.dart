import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth/auth.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Home Screen"),
              RaisedButton(
                child: Text("Logout"),
                onPressed: () {
                  authBloc.add(AuthSignOut());
                },
              ),
              RaisedButton(
                child: Text("Todos"),
                onPressed: () {
                  Navigator.of(context).pushNamed('/main/todos');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
