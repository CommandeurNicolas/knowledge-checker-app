import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// sign in anon
  Future signInAnom() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
    } catch (e) {}
  }
// sign in with email & pass

// register

// sign out

}
