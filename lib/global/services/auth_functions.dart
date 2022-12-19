import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<Object> loginUser(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  static Future<Object> createUser(emailAddress, password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );

      return credential;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static updateUser(String firstName) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      await user?.updateDisplayName(firstName);
      return user;
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }
}
