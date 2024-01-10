// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import '../model/user.dart';

// class FirebaseService {
//   static List<UserModel>? users;
//   Future<UserModel?> getData() async {
//     try {
//       User? user = FirebaseAuth.instance.currentUser;

//       if (user != null) {
//         DocumentSnapshot userDoc = await FirebaseFirestore.instance
//             .collection('users')
//             .doc(user.uid)
//             .get();

//         if (userDoc.exists) {
//           Map<String, dynamic> userData = userDoc.data() as Map<String, dynamic>;
//           return UserModel.fromJson(userData);
//         } else {
//           print('User document does not exist.');
//         }
//       } else {
//         print('No user is currently logged in.');
//       }
//     } catch (e) {
//       print('Error getting user data: $e');
//     }

//     return null;
//   }

 
//   // static Future<void> setUserLogin() async {
//   //   userLogin = await getUserLogin();
//   // }

//   static Future<UserModel?> getUserByUserName(String userName) async {
//     return await UserModel.getUserByUserName(userName);
//   }

//   static logOut() async {
//     //deleted token in file user.json
//   }

//   // static bool isEqualUsers(List<UserModel> lst) {
//   //   for (int i = 0; i < users!.length && i < lst.length; i++) {
//   //     if (!users![i].isEqual(lst[i])) {
//   //       return false;
//   //     }
//   //   }
//   //   return true;
//   // }

//   // static Future<List<UserModel>?> getAllUser() async {
//   //   users = await UserModel.getAllUser();
//   //   return users;
//   // }

//   // static String getStringPermission(UserModel user) {
//   //   return user.getStringPermission(user);
//   // }

//   // static bool getPermissionLivingRoom() {
//   //   return userLogin.getPermissionLivingRoom();
//   // }

//   // static bool getPermissionKitchen() {
//   //   return userLogin.getPermissionKitchen();
//   // }

//   // static bool getPermissionBedRoom() {
//   //   return userLogin.getPermissionBedRoom();
//   // }

//   // static bool getPermissionToilet() {
//   //   return userLogin.getPermissionToilet();
//   // }

//   // static bool isUserFullPermission(UserModel user) {
//   //   return user.isFullPermission();
//   // }

//   static bool isEqual(UserModel user1, UserModel user2) {
//     return user1.isEqual(user2);
//   }

//   static Future<bool> addUser(UserModel user) async {
//     return await user.add();
//   }

//   static Future<bool> updateUser(UserModel user) async {
//     return await user.update();
//   }

//   static Future<bool> deleteUser(UserModel user) async {
//     return await user.delete();
//   }
// }
