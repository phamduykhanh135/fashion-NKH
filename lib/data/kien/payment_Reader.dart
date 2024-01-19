import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_Reader.dart';

class Payments {
  String id;
  String name;
  bool status;
  String size;
  String price;
  String quality;
  String image;

  Payments({
    required this.id,
    required this.name,
    required this.status,
    required this.size,
    required this.price,
    required this.quality,
    required this.image,
  });

  Payments.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? '',
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        price = json['price'] ?? '',
        quality = json['quality'] ?? '',
        size = json['size'] ?? '',
        image = json['image'] ?? '';

  static List<Payments> payment = [];

  static Future<void> loadData_payment() async {
    try {
      CollectionReference paymentCollection =
          FirebaseFirestore.instance.collection('payments');

      QuerySnapshot Paymentsnapshot = await paymentCollection.get();

      payment = Paymentsnapshot.docs
          .map((doc) => Payments.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle exceptions or errors here
      print('Error loading data from Firestore: $e');
    }
  }

  static Future<String> generateAutoId() async {
    return FirebaseFirestore.instance.collection('payments').doc().id;
  }

  static Future<void> addNewpayment(List<Carts> selectedItems) async {
    try {
      CollectionReference paymentCollection =
          FirebaseFirestore.instance.collection('payments');

      for (var cart in selectedItems) {
        // Lấy autoId từ DocumentReference
        String newId = await generateAutoId();

        // Thêm mới một payment và lấy DocumentReference
        DocumentReference newPaymentRef = await paymentCollection.add({
          'id': newId,
          "name": cart.name,
          "status": true,
          "size": cart.size,
          "price": cart.price,
          "quality": cart.quality,
          "image": cart.image,
        });

        // Cập nhật ID của payment trong danh sách payments
        Payments newPayment = Payments(
          id: newId,
          name: cart.name,
          status: true,
          size: cart.size,
          price: cart.price,
          quality: cart.quality,
          image: cart.image,
        );
        payment.add(newPayment);
      }
    } catch (e) {
      print('Error adding new payment: $e');
    }
  }

  static Future<void> deleteAllPayments() async {
    try {
      QuerySnapshot paymentSnapshot =
          await FirebaseFirestore.instance.collection('payments').get();

      WriteBatch batch = FirebaseFirestore.instance.batch();

      for (QueryDocumentSnapshot doc in paymentSnapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      print('Error deleting all payments: $e');
    }
  }
}