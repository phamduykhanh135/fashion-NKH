import 'package:cloud_firestore/cloud_firestore.dart';

class Products {
  String id;
  String name;
  bool status;
  String description;
  String category;
  String discount;
  String image;
  String price;
  String sizeS;
  String sizeM;
  String sizeL;
  String sizeXL;

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
      : id = json["id"] ?? '',
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        category = json["category"] ?? '',
        discount = json["discount"] ?? '',
        image = json["image"] ?? '',
        price = json["price"] ?? '',
        description = json['Descriptions'] ?? '',
        sizeM=json["sizeM"]?? '',
        sizeS=json["sizeS"]?? '',
        sizeL=json["sizeL"]?? '',
        sizeXL=json["sizeXL"]?? '';

  static List<Products> products = [];

  static Future<void> loadData_product() async {
    try {
      CollectionReference productCollection =
          FirebaseFirestore.instance.collection('products');

      QuerySnapshot productSnapshot = await productCollection.get();

      products = productSnapshot.docs
          .map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle exceptions or errors here
      print('Error loading data from Firestore: $e');
    }
  }

  
}
