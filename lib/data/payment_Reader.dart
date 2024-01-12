import 'package:cloud_firestore/cloud_firestore.dart';
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
  static Future<void> addNewpayment(String name,String size,int price,int quality,String image) async {
    int newId = payment.length + 1;
    Payments newpayment =Payments(id: newId, name: name, status: true, size: size, price: price, quality: quality, image: image);
    payment.add(newpayment);
    // Thêm vào Firestore
    CollectionReference paymentCollection = FirebaseFirestore.instance.collection('payments');
    await paymentCollection.doc('$newId').set({
      "id": newId,
      "name": name,
      "status": true, 
      "size":size,
      "price":price,
      "quality":quality,
      "image":image
      
    });
   
  }

}