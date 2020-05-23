import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  @override
  BottomNavigationState get initialState => FirstPageLoaded(position: 0);

  @override
  Stream<BottomNavigationState> mapEventToState(
    BottomNavigationEvent event,
  ) async* {
    if (event is PageTapped) {
      if (event.position == 0) {
        print("A");
        yield FirstPageLoaded(position: event.position);
      }
      if (event.position == 1) {
        print("B");
        yield SecondPageLoaded(position: event.position);
      }
    }
  }
}
