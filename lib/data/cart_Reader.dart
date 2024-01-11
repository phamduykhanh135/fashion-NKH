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

}