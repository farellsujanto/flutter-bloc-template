import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/auth/auth.dart';
import 'package:todos_normal_test/blocs/bottom_navigation/bottom_navigation_bloc.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  AuthBloc _authBloc;
  BottomNavigationBloc _bottomNavigationBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _bottomNavigationBloc = BlocProvider.of<BottomNavigationBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          print(state);
          if (state is FirstPageLoaded) {
            return Container(
              child: Text("FIRST"),
            );
          }
          if (state is SecondPageLoaded) {
            return Container(
              child: Text("Second"),
            );
          }
          return Container(
            child: Text("BLANK"),
          );
        },
      ),
      bottomNavigationBar:
          BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                title: Text('Business'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                title: Text('School'),
              ),
            ],
            currentIndex: state.position,
            selectedItemColor: Colors.amber[800],
            onTap: (index) => _bottomNavigationBloc.add(
              PageTapped(position: index),
            ),
          );
        },
      ),
    );
  }
}
