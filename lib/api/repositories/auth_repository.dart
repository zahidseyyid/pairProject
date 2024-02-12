import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> loginUserWithEmail(String email, password) async {
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  Future<User?> createUserWithEmail(String email, password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user;
  }

  Future<void> userLogout() async {
    _auth.signOut();
  }

  Future<bool> isLoggedIn() async {
    final user = _auth.currentUser;
    return user != null;
  }

  Future<String?> getUserId() async {
    final user = _auth.currentUser;
    return user?.uid; // Kullanıcı kimlik bilgisini döndür
  }
}