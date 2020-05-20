import 'package:equatable/equatable.dart';
import 'auth.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthUninitialized extends AuthState {}

class AuthAuthenticated extends AuthState {
  final String displayName;

  const AuthAuthenticated(this.displayName);

  @override
  List<Object> get props => [];
  
  @override
  String toString() => 'Authenticated { displayName: $displayName }';
}

class AuthUnauthenticated extends AuthState {}

class AuthLoading extends AuthState {}