import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _autenticacao = FirebaseAuth.instance;
  final GoogleSignIn _google = GoogleSignIn();

  Stream<User?> get usuarioLogado => _autenticacao.authStateChanges();

  User? get usuarioAtual => _autenticacao.currentUser;

  Future<User?> entrarComGoogle() async {
    final conta = await _google.signIn();
    if (conta == null) return null;

    final autenticacao = await conta.authentication;

    final credencial = GoogleAuthProvider.credential(
      idToken: autenticacao.idToken,
      accessToken: autenticacao.accessToken,
    );

    final resultado = await _autenticacao.signInWithCredential(credencial);
    return resultado.user;
  }

  Future<void> sairDaConta() async {
    await _google.signOut();
    await _autenticacao.signOut();
  }
}
