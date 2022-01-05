import 'package:firebase_auth/firebase_auth.dart';

//Instance of Firebase Auth
final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  //Stream for the state
  Stream<User?> get onAuthChanges {
    return _auth.authStateChanges().map((item) => item);
  }

  //Register(Email)
  Future registerWithEmailAndPassword(email, password) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user;
  }

  //Sign In
  Future signIn(email, password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
    } catch (e) {
      return null;
    }
  }

  //Sign Out
  Future signOut() async {
    return await _auth.signOut();
  }
}
