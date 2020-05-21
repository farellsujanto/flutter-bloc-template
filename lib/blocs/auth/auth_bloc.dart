import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'auth.dart';
import 'package:todos_normal_test/repositories/firebase_auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthRepository _firebaseAuthRepository;
  StreamSubscription _authSubscription;

  AuthBloc({@required FirebaseAuthRepository firebaseAuthRepository})
      : assert(firebaseAuthRepository != null),
        _firebaseAuthRepository = firebaseAuthRepository;

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthInitialize) {
      yield* _mapAuthInitializeToState();
    }
    if (event is AuthLogin) {
      yield* _mapAuthLoginToState();
    }
    if (event is AuthInitializeBlank) {
      yield* _mapAuthEmptyToState();
    }
    if (event is AuthSignOut) {
      yield* _mapAuthSignOutToState();
    }
  }

  Stream<AuthState> _mapAuthInitializeToState() async* {
    _authSubscription?.cancel();
    _authSubscription =
        _firebaseAuthRepository.authStateListener().listen((user) {
      if (user != null) {
        add(AuthLogin());
      } else {
        add(AuthInitializeBlank());
      }
    });
    // final isSignedIn = await _firebaseAuthRepository.isSignedIn();
    // if (isSignedIn) {
    //   final name = await _firebaseAuthRepository.getUser();
    //   yield AuthAuthenticated(name);
    // } else {
    //   yield AuthUnauthenticated();
    // }
  }

  Stream<AuthState> _mapAuthEmptyToState() async* {
    yield AuthUnauthenticated();
  }

  Stream<AuthState> _mapAuthLoginToState() async* {
    yield AuthAuthenticated(await _firebaseAuthRepository.getUser());
  }

  Stream<AuthState> _mapAuthSignOutToState() async* {
    yield AuthUnauthenticated();
    _firebaseAuthRepository.signOut();
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
