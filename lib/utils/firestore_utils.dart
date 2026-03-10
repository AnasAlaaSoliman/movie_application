import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_data_model.dart';

abstract class FirestoreUtils {
  static CollectionReference<UserDataModel> getCollectionReferenceForUser() {
    return FirebaseFirestore.instance
        .collection(UserDataModel.collectionName)
        .withConverter<UserDataModel>(
          fromFirestore: (snapshot, _) =>
              UserDataModel.fromFireStore(snapshot.data()!),
          toFirestore: (value, _) => value.toFireStore(),
        );
  }

  static Future<void> addUser(UserDataModel user) async {
    var collectionRef = getCollectionReferenceForUser();
    var documentRef = collectionRef.doc(user.userId);

    await documentRef.set(user);
  }

  static Future<UserDataModel?> getUserFromFirestore(String userId) async {
    var doc = await getCollectionReferenceForUser().doc(userId).get();
    return doc.data();
  }
}
