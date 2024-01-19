import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Carts {
  String id;
  String name;
  String idUser;
  bool status;
  String size;
  String price;
  String quality;
  String image;
  static List<Carts> cart = [];

  Carts({
    required this.id,
    required this.idUser,
    required this.name,
    required this.status,
    required this.size,
    required this.price,
    required this.quality,
    required this.image,
  });

  Carts.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        idUser = json["idUser"] ?? "",
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        price = json['price'] ?? '',
        quality = json['quality'] ?? "",
        size = json['size'] ?? '',
        image = json['image'] ?? '';

  static Future<void> loadData_cart() async {
  try {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String? userId = currentUser?.uid;

    if (userId != null) {
      CollectionReference cartCollection = FirebaseFirestore.instance.collection('carts');
    print(userId);
      QuerySnapshot cartSnapshot = await cartCollection.where('idUser', isEqualTo: userId).get();

      cart = cartSnapshot.docs
          .map((doc) => Carts.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } else {
      cart.clear(); // Clear the cart list if user is not logged in
    }
  } catch (e) {
    // Handle exceptions or errors here
    print('Error loading data from Firestore: $e');
  }
}


  static Future<void> addNewCart(
      String name, String size, String price, String quality, String image) async {
    try {
      CollectionReference cartCollection =
          FirebaseFirestore.instance.collection('carts');

      // Tạo autoid mới
      String newId = cartCollection.doc().id;
      User? currentUser = FirebaseAuth.instance.currentUser;

      // Thêm vào Firestore với uid của người dùng hiện tại
      await cartCollection.doc(newId).set({
        "id": newId,
        'idUser': currentUser?.uid,
        "name": name,
        "status": true,
        "size": size,
        "price": price,
        "quality": quality,
        "image": image,
      });

      // Thêm vào danh sách cart
      Carts newCart = Carts(
        id: newId,
        idUser: currentUser?.uid ?? "",
        name: name,
        status: true,
        size: size,
        price: price,
        quality: quality,
        image: image,
      );
      cart.add(newCart);
    } catch (e) {
      // Handle exceptions or errors here
      print('Error adding new cart to Firestore: $e');
    }
  }

  static Future<void> deleteCartByAutoid(String autoid) async {
    try {
      // Tìm đối tượng cần xóa trong danh sách cart
      Carts cartToDelete =
          cart.firstWhere((cart) => cart.id == autoid);

      // Xóa đối tượng khỏi danh sách cart
      cart.remove(cartToDelete);

      // Xóa đối tượng trong Firestore
      await FirebaseFirestore.instance
          .collection('carts')
          .doc(autoid)
          .delete();

      print('Deleted cart with autoid: $autoid');
    } catch (e) {
      print('Error deleting cart by autoid: $e');
    }
  }
}