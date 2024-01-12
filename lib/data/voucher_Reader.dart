import 'package:cloud_firestore/cloud_firestore.dart';
class Vouchers{
  int id;
  String name;
  bool status;
  String image;
  String descriptions;
    Vouchers({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.descriptions
  });
  Vouchers.fromJson(Map<String, dynamic> json):
        id = json["id"] ?? 0,
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        image=json['image']?? '',
        descriptions=json['descriptions']?? '';  
        static List<Vouchers> voucher = [];
  static Future<void> loadData_voucher() async {
    try { 
      CollectionReference voucherCollection =
          FirebaseFirestore.instance.collection('voucher');

      QuerySnapshot Vouchersnapshot = await voucherCollection.get();

      voucher = Vouchersnapshot.docs
          .map((doc) => Vouchers.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Handle exceptions or errors here
      print('Error loading data from Firestore: $e');
    }
  }

}