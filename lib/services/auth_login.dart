import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth;
  AuthServices(this._auth);

  Future<User> signInAnonim() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> login({String email, String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User firebaseUser = result.user;
      return firebaseUser;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut() async {
    _auth.signOut();
  }

  Stream<User> get firebaseUserStream => _auth.idTokenChanges();

  Future readData(User fUser) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    FirebaseFirestore.instance
        .collection("Admin")
        .doc(fUser.uid)
        .get()
        .then((dataSnapshot) async {
      await pref.setString('Id_Admin', dataSnapshot.data()['Id_Admin']);
      await pref.setString('Email_Admin', dataSnapshot.data()['Email_Admin']);
      await pref.setString('Nama_Admin', dataSnapshot.data()['Nama_Admin']);
      await pref.setString('No_Telepon', dataSnapshot.data()['No_Telepon']);
      await pref.setString('Alamat', dataSnapshot.data()['Alamat']);
    });
  }
}
