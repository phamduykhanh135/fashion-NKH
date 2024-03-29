import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

class FirebaseModel {
  static Future<FirebaseFirestore?> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      await Firebase.initializeApp();
      return FirebaseFirestore.instance;
    } catch (e) {
      // ignore: avoid_print
      print('Error in Firebase.initializeApp(): $e');
      return null;
    }
  }

  static Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>?>getAllUsers() async {
    try {
      // Truy vấn Firestore
      Query<Map<String, dynamic>> query = FirebaseFirestore.instance
          .collection("users")
          .where("deleted", isEqualTo: false);
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await query.get();

      // Kiểm tra xem có tài liệu nào hay không
      if (querySnapshot.docs.isNotEmpty) {
        return querySnapshot.docs;
      }
    } catch (e) {
      // ignore: avoid_print
      print("error getAllUsers() in firebase.dart: $e");
    }

    return null;
  }

  static Future<Map<String, dynamic>?> getUserByUserName(
      String userName) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .where("userName", isEqualTo: userName)
              .limit(1)
              .get();

      return querySnapshot.docs.first.data();
    } catch (e) {
      // ignore: avoid_print
      print("error getUserByUserName() in fireBase.dart: $e");
      return null;
    }
  }

  static Future<bool> addUser(Map<String, dynamic> json) async {
    try {
      await FirebaseFirestore.instance.collection('users').add(json);

      // ignore: avoid_print
      print("add User success");
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('error addUser() in firebase.dart: $e');
      return false;
    }
  }

  static Future<bool> updateUser(
      String userName, Map<String, dynamic> json) async {
    try {
      Map<String, dynamic> data = Map.fromEntries(
        json.entries.where((entry) {
          //delete key: "null"
          return entry.value != null && entry.value.toString() != "null";
        }),
      );

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection("users")
              .where("userName", isEqualTo: userName)
              .limit(1)
              .get();

      FirebaseFirestore.instance
          .collection("users")
          .doc(querySnapshot.docs.first.id)
          .set(
            data,
            SetOptions(merge: true),
          );

      // ignore: avoid_print
      print("update User success");
      return true;
    } catch (e) {
      // ignore: avoid_print
      print('error updateUser() in firebase.dart: $e');
      return false;
    }
  }
}
//HAHAHAHAH