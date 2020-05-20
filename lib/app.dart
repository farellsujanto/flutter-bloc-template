import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/auth/auth.dart';
import 'router.dart';

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthAuthenticated) {
              _navigator.pushNamedAndRemoveUntil('/main', (_) => false);
            }
            if (state is AuthUnauthenticated) {
              _navigator.pushNamedAndRemoveUntil('/auth', (_) => false);
            }
          },
          child: child,
        );
      },
    );
  }
}
