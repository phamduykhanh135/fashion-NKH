import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  int id;
  String name;
  bool status;
  String description;
  String category;
  int discount;
  String image;
  int price;
  int sizeS;
  int sizeM;
  int sizeL;
  int sizeXL;

  Products({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.discount,
    required this.image,
    required this.price,
    required this.status,
    required this.sizeS,
    required this.sizeM,
    required this.sizeL,
    required this.sizeXL,
    
  });

  Products.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        category = json["category"] ?? '',
        discount = json["discount"] ?? 0,
        image = json["image"] ?? '',
        price = json["price"] ?? 0,
        description = json['Descriptions'] ?? '',
        sizeM=json["sizeM"]?? 0,
        sizeS=json["sizeS"]?? 0,
        sizeL=json["sizeL"]?? 0,
        sizeXL=json["sizeXL"]?? 0;

  static List<Products> products = [];

  static Future<void> loadData_product() async {
    try {
      CollectionReference _productCollection =
          FirebaseFirestore.instance.collection('products');

      QuerySnapshot _productSnapshot = await _productCollection.get();

      products = _productSnapshot.docs
          .map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle exceptions or errors here
      print('Error loading data from Firestore: $e');
    }
  }

  
}
