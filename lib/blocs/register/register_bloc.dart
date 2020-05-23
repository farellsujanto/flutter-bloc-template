import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todos_normal_test/blocs/login/login_event.dart';
import 'package:todos_normal_test/repositories/firebase_auth_repository.dart';
import 'validators.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  RegisterBloc({@required FirebaseAuthRepository firebaseAuthRepository})
      : assert(firebaseAuthRepository != null),
        _firebaseAuthRepository = firebaseAuthRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> mapEventToState(
    RegisterEvent event,
  ) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is RePasswordChanged) {}
    if (event is RegisterButtonPressed) {}
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }
}
