import 'package:cloud_firestore/cloud_firestore.dart';

class VoucherShips {
  int id;
  String name;
  bool status;
  String image;
  String descriptions;
  int value;

  VoucherShips({
    required this.id,
    required this.name,
    required this.status,
    required this.image,
    required this.descriptions,
    required this.value,
  });

  VoucherShips.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        name = json['name'] ?? '',
        status = json['status'] ?? false,
        image = json['image'] ?? '',
        value = json["value"] ?? 0,
        descriptions = json['descriptions'] ?? '';

  static List<VoucherShips> voucher = [];

  static Future<void> loadData_voucher() async {
    try {
      CollectionReference voucherCollection =
          FirebaseFirestore.instance.collection('voucherShip');

      QuerySnapshot VoucherShipsnapshot = await voucherCollection.get();

      voucher = VoucherShipsnapshot.docs
          .map((doc) =>
              VoucherShips.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // Xử lý ngoại lệ hoặc lỗi ở đây
      print('Error loading data from Firestore: $e');
    }
  }
}
