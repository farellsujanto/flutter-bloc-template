import 'package:flutter/material.dart';
import 'screens/screens.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/main':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/main/todos':
        return MaterialPageRoute(builder: (_) => TodosScreen());
      case '/auth':
        return MaterialPageRoute(builder: (_) => LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
