import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthInitialize extends AuthEvent {}

class AuthLogin extends AuthEvent {}

class AuthInitializeBlank extends AuthEvent {}

class AuthSignOut extends AuthEvent {}