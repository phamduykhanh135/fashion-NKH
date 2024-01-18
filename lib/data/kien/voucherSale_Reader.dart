import 'package:cloud_firestore/cloud_firestore.dart';

class VoucherSales {
  int id;
  String name;
  bool status;
  String image;
  String descriptions;
  int value;
  int money;

  VoucherSales({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.descriptions,
    required this.value,
    required this.money
  });

  VoucherSales.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        image = json['image'] ?? '',
        value = json["value"] ?? 0,
        money = json["money"] ?? 0,
        descriptions = json['descriptions'] ?? '';

  static List<VoucherSales> voucher = [];

  static Future<void> loadData_voucher() async {
    try {
      CollectionReference voucherCollection = FirebaseFirestore.instance.collection('voucherSale');

      QuerySnapshot VoucherSalesnapshot = await voucherCollection.get();

      voucher = VoucherSalesnapshot.docs
          .map((doc) => VoucherSales.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Xử lý ngoại lệ hoặc lỗi ở đây
      print('Error loading data from Firestore: $e');
    }
  }
}