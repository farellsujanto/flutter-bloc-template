import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todos_normal_test/screens/home/home_body.dart';
import '../../blocs/auth/auth.dart';
import 'package:todos_normal_test/blocs/bottom_navigation/bottom_navigation_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavigationBloc>(
      create: (context) => BottomNavigationBloc(),
      child: HomeBody(),
    );
  }
}
