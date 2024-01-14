import 'package:cloud_firestore/cloud_firestore.dart';

import 'cart_Reader.dart';
class Payments{
  int id;
  String name;
  bool status;
  String size;
  int price;
  int quality;
  String image;
    Payments({
    required this.id,
    required this.name,
    required this.status,
    required this.size,
    required this.price,
    required this.quality,
    required this.image
  });
  Payments.fromJson(Map<String, dynamic> json):
        id = json["id"] ?? 0,
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        price=json['price']?? 0,
        quality=json['quality']?? 0,
        size=json['size']??'',
        image=json['image']??'';
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
   static Future<void> addNewpayment(List<Carts> selectedItems) async {
    CollectionReference paymentCollection = FirebaseFirestore.instance.collection('payments');
    
    for (var cart in selectedItems) {
      await paymentCollection.doc('${cart.id}').set({
        "id": cart.id,
        "name": cart.name,
        "status": true,
        "size": cart.size,
        "price": cart.price,
        "quality": cart.quality,
        "image": cart.image,
      });
    }
  }
   static Future<void> deleteAllPayments() async {
    QuerySnapshot paymentSnapshot =
        await FirebaseFirestore.instance.collection('payments').get();

    WriteBatch batch = FirebaseFirestore.instance.batch();

    for (QueryDocumentSnapshot doc in paymentSnapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

}