import 'package:cloud_firestore/cloud_firestore.dart';

class Address {
  int id;
  String fullname;
  bool status;
  String addressText;
  String phone;

  Address({
    required this.id,
    required this.fullname,
    required this.status,
    required this.addressText,
    required this.phone,
  });

  Address.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? 0,
        fullname = json['fullname'] ?? '',
        status = json['status'] ?? false,
        addressText = json['address'] ?? '',
        phone = json['phone'] ?? '';

  static List<Address> _address = [];
  static List<Address> get address => _address;

  static Future<void> loadData_address() async {
    try {
      CollectionReference addressCollection =
          FirebaseFirestore.instance.collection('address');

      QuerySnapshot Addressnapshot = await addressCollection.get();

      _address = Addressnapshot.docs
          .map((doc) => Address.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error loading data from Firestore: $e');
    }
  }

  static Future<void> addNewaddress(
      String fullname, String address, String phone) async {
    int newId = _address.length + 1;
    Address newaddress = Address(
      id: newId,
      fullname: fullname,
      status: true,
      addressText: address,
      phone: phone,
    );
    _address.add(newaddress);

    CollectionReference addressCollection =
        FirebaseFirestore.instance.collection('address');
    await addressCollection.doc('$newId').set({
      "id": newId,
      "fullname": fullname,
      "status": true,
      'address': address,
      'phone': phone,
    });
  }
  static Future<void> deleteaddress(String addressId) async {
  try {
    await FirebaseFirestore.instance.collection('address').doc(addressId).delete();
    print('Deleted cart with ID: $addressId');
  } catch (e) {
    print('Error deleting cart: $e');
  }
}
}