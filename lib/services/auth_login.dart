import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth;
  AuthServices(this._auth);

  // Future<User> login({String email, String password}) async {
  //   UserCredential result = await _auth.signInWithEmailAndPassword(
  //       email: email, password: password);
  // User firebaseUser = result.user;
  // return firebaseUser;
  // }

  Future<User> login({String email, String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  Stream<User> get firebaseUserStream => _auth.idTokenChanges();
}
