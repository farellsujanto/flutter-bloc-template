import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'auth.dart';
import 'package:todos_normal_test/repositories/firebase_auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuthRepository _firebaseAuthRepository;

  AuthBloc({@required FirebaseAuthRepository firebaseAuthRepository})
      : assert(firebaseAuthRepository != null),
        _firebaseAuthRepository = firebaseAuthRepository;

  @override
  AuthState get initialState => AuthUninitialized();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AuthInitialize) {
      _mapAuthInitializeToState();
    }
    if (event is AuthLogin) {
      _mapAuthLoginToState();
    }
    if (event is AuthSignOut) {
      _mapAuthSignOutToState();
    }
  }

  Stream<AuthState> _mapAuthInitializeToState() async* {
    final isSignedIn = await _firebaseAuthRepository.isSignedIn();
    if (isSignedIn) {
      final name = await _firebaseAuthRepository.getUser();
      yield AuthAuthenticated(name);
    } else {
      yield AuthUnauthenticated();
    }
  }

  Stream<AuthState> _mapAuthLoginToState() async* {
      yield AuthAuthenticated(await _firebaseAuthRepository.getUser());
  }

  Stream<AuthState> _mapAuthSignOutToState() async* {
      yield AuthUnauthenticated();
      _firebaseAuthRepository.signOut();
  }
}
