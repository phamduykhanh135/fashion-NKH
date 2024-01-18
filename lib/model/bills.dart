import 'package:cloud_firestore/cloud_firestore.dart';

class Bills {
  int mahd;
  List<Map<String, dynamic>> items;
  DateTime timestamp;
  double totalAmount;
  bool bill_state;
  bool cancel_state;
  bool confirm_state;

  Bills({
    required this.mahd,
    required this.items,
    required this.timestamp,
    required this.totalAmount,
    required this.bill_state,
    required this.cancel_state,
    required this.confirm_state,
  });

  factory Bills.fromJson(Map<String, dynamic> json) => Bills(
        mahd: json["mahd"] ?? 0,
        items: List<Map<String, dynamic>>.from(json['items'] ?? []),
        timestamp: (json['timestamp'] as Timestamp).toDate(),
        totalAmount: json["totalAmount"] ?? 0,
        bill_state: json["bill_state"] ?? true,
        cancel_state: json["cancel_state"] ?? false,
        confirm_state: json["confirm_state"] ?? false,
      );

  static List<Bills> bills = [];

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  static Future<void> loadBills() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('invoices').get();

      List<Bills> loadedBills = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Bills.fromJson(data);
      }).toList();

      // Gán danh sách bills đã load vào biến bills
      bills = loadedBills;
    } catch (error) {
      print('Error loading bills: $error');
    }
  }
}