import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:laundry_day/models/user.dart';
import 'package:laundry_day/services/user_service.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore database = FirebaseFirestore.instance;

class AuthService {
//Custom user from FirebaseAuthUser
  AuthUser? _customUser(User? user) {
    return user != null ? AuthUser(uid: user.uid) : null;
  }

  //Stream for AuthState
  Stream<AuthUser?> get onAuthChanges {
    return _auth.authStateChanges().map((user) => _customUser(user));
  }

  //Register(Email)
  Future<User?> registerWithEmailAndPassword(CustomUser user) async {
    UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: user.email, password: user.password);

    final UserService _userService = UserService(uid: result.user!.uid);
    await _userService.registerUserOnCollection(user);
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
