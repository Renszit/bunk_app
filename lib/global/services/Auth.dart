import 'package:firebase_auth/firebase_auth.dart';

// ignore: camel_case_types
class Auth {
  static Future<Object> loginUser(emailAddress, password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return e.code;
      } else if (e.code == 'wrong-password') {
        return e.code;
      }
    }
    return false;
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
      if (e.code == 'weak-password') {
        return false;
      } else if (e.code == 'email-already-in-use') {
        return false;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

  static signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  static getUser() {
    return FirebaseAuth.instance.currentUser;
  }

  static updateUser(String firstName) {
    FirebaseAuth.instance.currentUser!.updateDisplayName(firstName);
  }
}
