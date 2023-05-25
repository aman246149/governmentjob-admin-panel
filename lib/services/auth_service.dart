import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
static  final FirebaseAuth _auth=FirebaseAuth.instance;
  
  static Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      rethrow;
    }
   
  }

 static Future<void> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }  catch (e) {
     rethrow;
    }
  }

 static Future<void> logOut() async => await _auth.signOut();

}