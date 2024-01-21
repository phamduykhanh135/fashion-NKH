import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  String sizeL;
  String sizeM;
  String sizeS;
  String sizeXL;

  Products({
    required this.sizeL,
    required this.sizeM,
    required this.sizeS,
    required this.sizeXL,
    
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        sizeL: json["sizeL"] ?? '',       
        sizeM: json['sizeM']??'',
        sizeS: json['sizeS']??'',
        sizeXL: json['sizeXL']??'',
      );

  static List<Products> products = [];

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  static Future<void> loadProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('products').get();

      List<Products> loadedProducts = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Products.fromJson(data);
      }).toList();

      // Gán danh sách Products đã load vào biến Products
      products = loadedProducts;
    } catch (error) {
      print('Error loading Products: $error');
    }
  }
}