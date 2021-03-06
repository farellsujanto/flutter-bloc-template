import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends LoginEvent {
  final String email;

  const EmailChanged({@required this.email});

  @override
  List<Object> get props => [email];

  @override
  String toString() => 'EmailChanged { email :$email }';
}

class PasswordChanged extends LoginEvent {
  final String password;

  const PasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class RePasswordChanged extends LoginEvent {
  final String password;

  const RePasswordChanged({@required this.password});

  @override
  List<Object> get props => [password];

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({@required this.email, @required this.password});

  @override
  List<Object> get props => [email, password];

  @override
  String toString() {
    return 'Login Button Pressed { email: $email, password: $password }';
  }
}

class LoginWithGoogleButtonPressed extends LoginEvent {}
