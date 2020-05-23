part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class PageTapped extends BottomNavigationEvent {
  final int position;

  const PageTapped({@required this.position});

  @override
  List<Object> get props => [position];

  @override
  String toString() => 'PageTapped { position :$position }';
}