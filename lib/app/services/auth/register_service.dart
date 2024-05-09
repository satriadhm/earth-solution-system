
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await _firestore.collection('users').doc(user!.uid).set({
        'email': email,
        'uid': user.uid,
        'name': '',
        'alamat': '',
        'noTelp': '',
        'namaInstansi': '',
        'emailInstansi': '',
      });
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future updateUserData(String name, String alamat, String noTelp, String namaInstansi, String emailInstansi) async {
    User? user = _auth.currentUser;
    try {
      await _firestore.collection('users').doc(user!.uid).update({
        'name': name,
        'alamat': alamat,
        'noTelp': noTelp,
        'namaInstansi': namaInstansi,
        'emailInstansi': emailInstansi,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updateEmail(String email) async {
    User? user = _auth.currentUser;
    try {
      await _firestore.collection('users').doc(user!.uid).update({
        'email': email,
      });
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future updatePassword(String password) async {
    User? user = _auth.currentUser;
    try {
      await user!.updatePassword(password);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

}