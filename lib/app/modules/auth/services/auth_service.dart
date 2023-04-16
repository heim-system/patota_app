import 'package:firebase_auth/firebase_auth.dart';
import 'package:patota_app/app/modules/login/domain/entities/auth_user.dart';
import 'package:patota_app/app/modules/login/domain/models/auth_user.dart';
import 'package:patota_app/core/state/estate.dart';

class AuthService extends Estate<AuthUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthService() : super(AuthUser()) {
    _authCheck();
  }

  void _authCheck() {
    _auth.authStateChanges().listen((User? user) async {
      if (user != null) {
        await _auth.currentUser?.reload();
        _getUser();
      } else {
        setLoading();
      }
    });
  }

  void _getUser() {
    value.email = _auth.currentUser?.email ?? '';
    value.displayName = _auth.currentUser?.displayName ?? '';
    value.userId = _auth.currentUser?.uid ?? '';
    value.photoUrl = _auth.currentUser?.photoURL ?? '';
    setReady();
  }

  Future<void> register(IAuthUser authUser) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: authUser.email,
        password: authUser.password,
      );

      await _auth.currentUser!.updateDisplayName(value.displayName);
      await _auth.currentUser!.updatePhotoURL(value.photoUrl);

      _getUser();
    } on FirebaseAuthException catch (e) {
      final message = e.message ?? '';
      setError(message);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      _getUser();
    } catch (e) {
      setError('Erro ao efetuar login');
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await _auth.currentUser?.reload();
      value.clear();
      setLoading();
    } catch (e) {
      setError('Erro ao efetuar logout');
    }
  }
}
