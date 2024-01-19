import 'dart:convert';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Product {
  late String id;
  late String image;
  late String name;
  late String price;
  late bool status;
  late String descriptions;
  late String category;
  late String discount;

  Product() {
    id = "";
    image = "";
    name = "";
    price = "";
    status = false;
    descriptions = "";
    category="";
    discount="";
  }

  Product.info({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.status,
    required this.discount,
  //  required this.size,
    required this.descriptions,
    required this.category
  });

  Product.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? "",
        image = json['image'] ?? "",
        name = json['name'] ?? "",
        price = (json['price'] ?? "") ,// Kiểm tra và chuyển đổi kiểu nếu cần
        status = json['status'] ?? false,
        //size = json['size'] ?? "",
        discount = (json['discount'] ?? "") ,
        descriptions = json['Descriptions'] ?? "",
        category = json['category'] ?? "";

  Product.copy(Product product)
      : id = product.id,
        image = product.image,
        name = product.name,
        price = product.price,
        status = product.status,
        discount = product.discount,
        //size = product.size,
        descriptions = product.descriptions,
        category=product.category;

  Map<String, dynamic> toJson({bool? deleted}) {
    return {
      'id': id,
      'image': image,//.isNotEmpty ? image : "null",
      'name': name,
      'price': price,
      'status': status,
      'discount': discount,
      //'size': size,
      'Descriptions': descriptions,
      'category':category,
      'deleted': deleted ?? false,
    };
  }

  bool isEqual(Product otherProduct) {
    bool result = id == otherProduct.id;
    result = result && image == otherProduct.image;
    result = result && name == otherProduct.name;
    result = result && price == otherProduct.price;
    result = result && status == otherProduct.status;
    // result = result && size == otherProduct.size;
      result = result && discount == otherProduct.discount;
    result = result && descriptions == otherProduct.descriptions;
    result = result && category == otherProduct.category;
    return result;
  }

  static Uint8List convertStringToUint8List(String base64String) {
    List<int> bytes = base64.decode(base64String);
    return Uint8List.fromList(bytes);
  }

  static String convertImageToString(Uint8List uint8List) {
    String s = base64Encode(uint8List);
    return s;
  }
}

class FirebaseModel {
  // ...

 Future<Product?> getProductData(String productId) async {
    try {
      // Replace 'yourFirestoreCollection' with the actual collection name
      DocumentSnapshot<Map<String, dynamic>> productSnapshot = await FirebaseFirestore.instance
          .collection('products')
          .doc(productId)
          .get();

      if (productSnapshot.exists) {
        Map<String, dynamic> productData = productSnapshot.data()!;
        return Product.fromJson(productData); // Assuming you have a method to convert data to Product
      } else {
        // Product not found
        return null;
      }
    } catch (error) {
      print("Error getting product data: $error");
      return null;
    }
  }

  Future<List<Product>> getProductsData() async {
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    try {
      QuerySnapshot productsSnapshot = await productsCollection.get();

      List<Product> productsList = productsSnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return Product.fromJson(data);
      }).toList();

      return productsList;
    } catch (error) {
      print("Error getting products: $error");
      rethrow;
    }
  }


  Future<List<Product>> searchProducts(String searchQuery) async {
  try {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await FirebaseFirestore.instance
            .collection("products")
            .where("name", isGreaterThanOrEqualTo: searchQuery)
            .where("name", isLessThan: '${searchQuery}z')
            .get();

    // Convert data from QuerySnapshot to a list of products
    List<Product> products = querySnapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .toList();

    return products;
  } catch (e) {
    print("Error searching products by name: $e");
    // Handle the error or return an empty list depending on your requirements
    return [];
  }
}


Future<List<Product>> searchProductsByCategory(String searchQuery, String category) async {
  try {
    // Thực hiện truy vấn tìm kiếm trong collection 'product' theo trường 'name' và 'category'
    QuerySnapshot<Map<String, dynamic>> querySnapshot;

    if (category == "Tất cả") {
      // Nếu là "Tất cả", không áp dụng điều kiện tìm kiếm theo danh mục
      querySnapshot = await FirebaseFirestore.instance
          .collection("products")
          //.where("name", isGreaterThanOrEqualTo: searchQuery)
          .get();
    } else {
      // Nếu không phải "Tất cả", áp dụng điều kiện tìm kiếm theo danh mục
      querySnapshot = await FirebaseFirestore.instance
          .collection("products")
         // .where("name", isGreaterThanOrEqualTo: searchQuery)
          .where("category", isEqualTo: category)
          .get();
    }

    // Chuyển đổi dữ liệu từ QuerySnapshot thành danh sách sản phẩm
    List<Product> products = querySnapshot.docs
        .map((doc) => Product.fromJson(doc.data()))
        .toList();

    return products;
  } catch (e) {
    print("Error searching products by category: $e");
    // Xử lý lỗi hoặc trả về danh sách rỗng tùy thuộc vào yêu cầu của bạn
    return [];
  }
}


  Future<int> fetchTotalProductCount() async {
    final CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    QuerySnapshot productsSnapshot = await productsCollection.get();
    return productsSnapshot.size;
  }
}


