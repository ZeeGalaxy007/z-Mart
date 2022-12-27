import 'package:emart_app/consts/firebase_consts.dart';

class FireStoreServices {
  //get user data
  static getUser(uid) {
    return firestore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }
}
