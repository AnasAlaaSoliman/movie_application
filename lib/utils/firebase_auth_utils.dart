import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_data_model.dart';
import 'firestore_utils.dart';

class FirebaseAuthUtils {
  static Future<UserDataModel?> createUserWithEmailAndPassword(
    String name,
    String email,
    String password,
    String phoneNumber,

  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      UserDataModel user = UserDataModel(
        userId: credential.user!.uid,
        userName: name,
        userEmail: email,
        phoneNumber: phoneNumber,
        avatarIndex: 0,
      );
      FirestoreUtils.addUser(user);
      return Future.value(user);
    } on FirebaseAuthException catch (e) {
      return Future.value(null);
    }
  }

  static Future<UserDataModel?> signInWithEmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      UserDataModel? user = await FirestoreUtils.getUserFromFirestore(
        credential.user!.uid,
      );
      print('User Name${user?.userName}');
      return Future.value(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      return Future.value(null);
    }
  }

  static Future<void> resetPassword(String userEmail) async {

    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: userEmail,
    );
  }


  static Future<void> deleteCurrentUser() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) throw Exception("No user logged in");

    try {
      // 1. احذف من Firestore
      await FirestoreUtils.deleteUser(user.uid);

      // 2. احذف من Auth
      await user.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw Exception("REQUIRES_RELOGIN");
      } else {
        throw Exception(e.message);
      }
    }
  }

  static Future<void> reAuthenticate(
      String email,
      String password,
      ) async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    final cred = EmailAuthProvider.credential(
      email: email,
      password: password,
    );

    await user.reauthenticateWithCredential(cred);
  }
}
