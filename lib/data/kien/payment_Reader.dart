import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'cart_Reader.dart';

class Payments {
  String id;
  String name;
  String idUser;
  bool status;
  String size;
  String price;
  String quality;
  String image;

  Payments({
    required this.id,
    required this.name,
    required this.idUser,
    required this.status,
    required this.size,
    required this.price,
    required this.quality,
    required this.image,
  });

  Payments.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? '',
        name = json['name'] ?? '',
        idUser = json['idUser'] ?? '',
        status = json['status'] ?? false,
        price = json['price'] ?? '',
        quality = json['quality'] ?? '',
        size = json['size'] ?? '',
        image = json['image'] ?? '';

  static List<Payments> payment = [];

  static Future<void> loadData_payment() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String userId = currentUser.uid;
        print(userId);

        CollectionReference paymentCollection =
            FirebaseFirestore.instance.collection('payments');
        QuerySnapshot Paymentsnapshot =
            await paymentCollection.where('idUser', isEqualTo: userId).get();
        payment = Paymentsnapshot.docs
            .map((doc) =>
                Payments.fromJson(doc.data() as Map<String, dynamic>))
            .toList();

        print(payment.length);
      } else {
        payment.clear();
      }
    } catch (e) {
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
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        String userId = currentUser.uid;

        for (var cart in selectedItems) {
          // Lấy autoId từ DocumentReference
          String newId = await generateAutoId();

          // Thêm mới một payment và lấy DocumentReference
          DocumentReference newPaymentRef = await paymentCollection.add({
            'id': newId,
            'idUser': userId,
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
            idUser: userId,
            name: cart.name,
            status: true,
            size: cart.size,
            price: cart.price,
            quality: cart.quality,
            image: cart.image,
          );
          payment.add(newPayment);
        }
      } else {
        print('No user logged in');
      }
    } catch (e) {
      print('Error adding new payment: $e');
    }
  }

  static Future<void> deleteAllPayments() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser != null) {
        String userId = currentUser.uid;

        QuerySnapshot paymentSnapshot = await FirebaseFirestore.instance
            .collection('payments')
            .where('idUser', isEqualTo: userId)
            .get();

        WriteBatch batch = FirebaseFirestore.instance.batch();

        for (QueryDocumentSnapshot doc in paymentSnapshot.docs) {
          batch.delete(doc.reference);
        }

        await batch.commit();
      }
    } catch (e) {
      print('Error deleting all payments: $e');
    }
  }
}