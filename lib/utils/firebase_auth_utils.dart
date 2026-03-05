import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_app/models/user_data_model.dart';
import 'package:movie_app/utils/firestore_utils.dart';

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
}
