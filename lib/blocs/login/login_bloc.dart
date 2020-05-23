import 'dart:async';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'login.dart';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todos_normal_test/repositories/firebase_auth_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  LoginBloc({@required FirebaseAuthRepository firebaseAuthRepository})
      : assert(firebaseAuthRepository != null),
        _firebaseAuthRepository = firebaseAuthRepository;

  @override
  LoginState get initialState => LoginState.empty();

  @override
  Stream<Transition<LoginEvent, LoginState>> transformEvents(
    Stream<LoginEvent> events,
    TransitionFunction<LoginEvent, LoginState> transitionFn,
  ) {
    final nonDebounceStream = events.where((event) {
      return (event is! EmailChanged && event is! PasswordChanged);
    });
    final debounceStream = events.where((event) {
      return (event is EmailChanged || event is PasswordChanged);
    }).debounceTime(Duration(milliseconds: 300));
    return super.transformEvents(
      nonDebounceStream.mergeWith([debounceStream]),
      transitionFn,
    );
  }

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    }
    if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    }
    if (event is LoginButtonPressed) {
      yield* _mapLoginButtonPressedToState(
        email: event.email,
        password: event.password,
      );
    }
    if (event is LoginWithGoogleButtonPressed) {}
  }

  Stream<LoginState> _mapEmailChangedToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<LoginState> _mapPasswordChangedToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<LoginState> _mapLoginButtonPressedToState({
    String email,
    String password,
  }) async* {
    yield LoginState.loading();
    try {
      await _firebaseAuthRepository.signInWithCredentials(email, password);
      yield LoginState.success();
    } catch (e) {
      print(e);
      yield LoginState.failure(e.message);
    }
  }
}
