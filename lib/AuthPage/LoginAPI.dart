import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginAPI {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  // Register with email and password
  Future<User?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      return result.user;
    } catch (error) {
      print("error");
      print(error.toString());
      return null;
    }
  }

  // Sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        UserCredential result =
            await _firebaseAuth.signInWithCredential(credential);
        return result.user;
      }
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}
