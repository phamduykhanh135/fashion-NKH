import 'dart:convert';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/model/Utils.dart';
import 'package:sales_application/presenters/menu_dart.dart';
import 'package:sales_application/presenters/sigin_in_screen.dart';

import 'firebase.dart';

class UserModel{
  late String id;
  late Uint8List? image;
  late String fullname;
  late String email;
  late String phone;
  late String address;
  late bool admin;
  late bool custom;

   UserModel() {
    id = "";
    image = null;
    fullname = "";
    email = "";
    phone = "";
     address="";
    admin =false;
    custom =false;
  }

  UserModel.info(
      {this.id = '',
      required this.image,
      required this.fullname,
      required this.email,
      required this.phone,
      required this.address,
      required this.admin,
      required this.custom});

  UserModel.fromJson(Map<String, dynamic> json)
      : image = json['image'] != null && json['image'] != "null"
            ? convertStringToUint8List(json['image'])
            : null,
        fullname = json['fullname'],
        email = json['email'],
        phone = json['phone'],
        address = json['address'],
        admin = json['admin'],
        custom = json['custom'];

  UserModel.copy(UserModel user)
      : image = user.image,
        fullname = user.fullname,
        email = user.email,
        phone = user.phone,
        address = user.address,
        admin = user.admin,
        custom = user.custom;

  Map<String, dynamic> toJson({bool? deleted}) {
    return {
      'image':image?.isNotEmpty ?? false ? convertImageToString(image!) : "null",
      'fullname': fullname,
      'email': email,
      'phone': phone,
      'address': address,
      'admin': admin,
      'custom': custom,
      'deleted': deleted ?? false
    };
  }

  bool isEqual(UserModel otherUser) {
     bool  result =fullname == otherUser.fullname;
    result = result && email == otherUser.email;
    result = result && phone == otherUser.phone;
     result = result && address == otherUser.address;
    result = result && admin == otherUser.admin;
    result = result && custom == otherUser.custom;
    result = result && image == otherUser.image;
    return result;
  }

  static Future<UserModel?> getUserByUserName(String userName) async {
    Map<String, dynamic>? map = await FirebaseModel.getUserByUserName(userName);
    if (map != null) {
      return UserModel.fromJson(map);
    }
    return null;
  }

  static Future<List<UserModel>> getAllUser() async {
    List<UserModel> users = [];
    List<QueryDocumentSnapshot<Map<String, dynamic>>>? querySnapshotDocs =
        await FirebaseModel.getAllUsers();

    for (var document in querySnapshotDocs!) {
      Map<String, dynamic> userData = document.data();

      UserModel user = UserModel.fromJson(userData);
      users.add(user);
    }

    return users;
  }

  static Uint8List convertStringToUint8List(String base64String) {
    List<int> bytes = base64.decode(base64String);
    return Uint8List.fromList(bytes);
  }

  static String convertImageToString(Uint8List uint8List) {
    String s = base64Encode(uint8List);
    return s;
  }


  Future<bool> add() async {
    return await FirebaseModel.addUser(toJson());
  }

  Future<bool> update() async {
    return await FirebaseModel.updateUser(fullname, toJson());
  }

  Future<bool> delete() async {
    return await FirebaseModel.updateUser(fullname, toJson(deleted: true));
  }
}
class FirestoreService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel?> getUserData() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        DocumentSnapshot userDoc = await _firestore
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists) {
          return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
        } else {
          print('User document does not exist.');
        }
      } else {
        print('No user is currently logged in.');
      }
    } catch (e) {
      print('Error getting user data: $e');
    }

    return null;
  }
}
Future<void> signUp(
    BuildContext context, UserModel user, String password) async {
  try {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    final auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: user.email.trim(),
      password: password.trim(),
    );
    user.id = auth.user!.uid;
    // ignore: avoid_print
    print('Tài khoản đã được tạo thành công!');
    await FirebaseFirestore.instance
        .collection('users')
        .doc(auth.user!.uid)
        .set(user.toJson());

    Utils.showSnackBarTrue('Tài khoản đã được tạo thành công!');
  } on FirebaseAuthException catch (e) {
    // Ẩn loading indicator
    Navigator.of(context).pop();

    // Hiển thị thông báo thất bại
    Utils.showSnackBarFalse(e.message);
  } finally {
    // Đóng hộp thoại
    Navigator.pop(context);
  }
}

Future<void> signIn(BuildContext context, String email, String password) async {
  try {
    FirebaseAuth.instance.signOut();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

// Không in ở đây, kiểm tra bên trong điều kiện if
    if (FirebaseAuth.instance.currentUser != null) {
      print("Thông tin người dùng hiện tại: ${FirebaseAuth.instance.currentUser}");
      // Đăng nhập thành công, chuyển hướng đến màn hình Home
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Menu_Screen()),
      );
      DocumentSnapshot<Map<String, dynamic>> userData = await FirebaseFirestore
          .instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();

      // if (userData.exists) {
      //   bool isDeleted = userData.data()?["deleted"] ?? false;
      //   bool blocked = userData.data()?["blocked"] ?? false;
      //   if (isDeleted) {
      //     // Tài khoản đã bị đánh dấu xóa
      //     // Xử lý tùy thuộc vào yêu cầu của bạn
      //     Utils.showSnackBarFalse("Tài khoản đã bị Xóa!");
      //   } else if (blocked) {
      //     // Tài khoản đã bị đánh dấu xóa
      //     // Xử lý tùy thuộc vào yêu cầu của bạn
      //     Utils.showSnackBarFalse("Tài khoản đã bị Khóa!");
      //   } else {
      //     print("Chuyển trang");
      //     // Đăng nhập thành công, chuyển hướng đến màn hình Home
      //     Navigator.pushNamed(context, "/");
      //   }
      // }
    } else {
      // Đăng nhập không thành công, xuất thông báo
      print("Mật khẩu không hợp lệ");
      Utils.showSnackBarFalse("Mật khẩu không hợp lệ");
    }
  } on FirebaseAuthException {
    // Utils.showSnackBarFalse(e.message)
    Utils.showSnackBarFalse("Mật khẩu không hợp lệ");
  }
}

void logOut(BuildContext context) async {
  await FirebaseAuth.instance.signOut();

  print("Đã đăng xuất");

  print(FirebaseAuth.instance.currentUser);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => const SiginIn_Screen()),
  );
}

Future<void> updateUserDataWithImage(Uint8List? image) async {
   final FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null && image != null) {
        await firestore.collection('users').doc(currentUser.uid).update({
          'image': image.isNotEmpty ? UserModel.convertImageToString(image) : "null",
        });
        print('User image updated successfully.');
      } else {
        print('No user is currently logged in or image data is empty.');
      }
    } catch (e) {
      print('Error updating user image: $e');
    }
  }

  class ImageChangeEvent {
  final Uint8List? newImage;

  ImageChangeEvent(this.newImage);
}
class ImageChangeNotifier extends ChangeNotifier {
  ImageChangeEvent? _imageChangeEvent;

  void setImageChangeEvent(ImageChangeEvent event) {
    _imageChangeEvent = event;
    notifyListeners();
  }

  ImageChangeEvent? get imageChangeEvent => _imageChangeEvent;
}

Future<void> updateUserInfo(String name,int number) async {
  User? currentUser = FirebaseAuth.instance.currentUser;

  if (currentUser != null) {
    await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).update({
      if(number == 1)
      'fullname': name,
      if(number == 2)
      'phone': name,
      if(number == 3)
      'email': name,
      if(number == 4)
      'address': name,

      
    });
  } else {
    print('Người dùng chưa đăng nhập');
  }
}
