import 'package:cloud_firestore/cloud_firestore.dart';
class Carts{
  int id;
  String name;
  bool status;
  String size;
  int price;
  int quality;
  String image;
    Carts({
    required this.id,
    required this.name,
    required this.status,
    required this.size,
    required this.price,
    required this.quality,
    required this.image
  });
  Carts.fromJson(Map<String, dynamic> json):
        id = json["id"] ?? 0,
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        price=json['price']?? 0,
        quality=json['quality']?? 0,
        size=json['size']??'',
        image=json['image']??'';
        static List<Carts> cart = [];
  static Future<void> loadData_cart() async {
    try {
      CollectionReference cartCollection =
          FirebaseFirestore.instance.collection('carts');

      QuerySnapshot cartSnapshot = await cartCollection.get();

      cart = cartSnapshot.docs
          .map((doc) => Carts.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle exceptions or errors here
      print('Error loading data from Firestore: $e');
    }
  }
  static Future<void> addNewCart(String name,String size,int price,int quality,String image) async {
    int newId = cart.length + 1;
    Carts newCart =Carts(id: newId, name: name, status: true, size: size, price: price, quality: quality, image: image);
    cart.add(newCart);
    // Thêm vào Firestore
    CollectionReference cartCollection = FirebaseFirestore.instance.collection('carts');
    await cartCollection.doc('$newId').set({
      "id": newId,
      "name": name,
      "status": true, 
      "size":size,
      "price":price,
      "quality":quality,
      "image":image
      
    });
   
  }
   static Future<void> deleteCart(String cartId) async {
    try {
      await FirebaseFirestore.instance.collection('carts').doc(cartId).delete();
    } catch (e) {
      print('Error deleting cart: $e');
    }
  }

}