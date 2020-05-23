part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationState extends Equatable {
  final int position = 0;

  const BottomNavigationState();

  @override
  List<Object> get props => [];
}

class FirstPageLoaded extends BottomNavigationState {
  final int position;

  const FirstPageLoaded({@required this.position});

  @override
  List<Object> get props => [position];
}

class SecondPageLoaded extends BottomNavigationState {
  final int position;

  const SecondPageLoaded({@required this.position});

  @override
  List<Object> get props => [position];
}
