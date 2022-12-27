import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//very imp veriable
FirebaseAuth auth = FirebaseAuth.instance; //use for authentication

FirebaseFirestore firestore =
    FirebaseFirestore.instance; //use for cloud data store enter and create

User? currentUser = auth.currentUser; //for user aucth

//collecetions
const usersCollection = "users";
