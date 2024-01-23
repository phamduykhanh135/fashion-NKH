import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Address {
  String id;
  String fullname;
  String idUser;
  bool status;
  String addressText;
  String phone;

  Address({
    required this.id,
    required this.idUser,
    required this.fullname,
    required this.status,
    required this.addressText,
    required this.phone,
  });

  Address.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? '',
      idUser = json["idUser"] ?? '',
        fullname = json['fullname'] ?? '',
        status = json['status'] ?? false,
        addressText = json['address'] ?? '',
        phone = json['phone'] ?? '';

  static List<Address> _address = [];
  static List<Address> get address => _address;

  static String? addressToDeleteId; // Variable to store the address ID to be deleted

  static Future<void> loadData_address() async {
    try {
       User? currentUser = FirebaseAuth.instance.currentUser;
    String? userId = currentUser?.uid;
      if (userId != null) {
         CollectionReference addressCollection =
          FirebaseFirestore.instance.collection('address');

      QuerySnapshot addressSnapshot = await addressCollection.where('idUser', isEqualTo: userId).get();

      _address = addressSnapshot.docs
          .map((doc) => Address.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
     
      }
  } catch (e) {
    // Handle exceptions or errors here
    print('Error loading data from Firestore: $e');
  }
   
  }

  static Future<String> generateAutoId() async {
    return FirebaseFirestore.instance.collection('address').doc().id;
  }

  static Future<void> addNewaddress(
      String fullname, String address, String phone) async {
    try {
      CollectionReference addressCollection =
          FirebaseFirestore.instance.collection('address');
          User? currentUser = FirebaseAuth.instance.currentUser;
          
      // Lấy autoId từ DocumentReference
      String newId = addressCollection.doc().id;

      // Thêm đối tượng Address vào Firestore với autoId
      await addressCollection.doc(newId).set({
        'idUser':currentUser?.uid,
        "id": newId,
        "fullname": fullname,
        "status": true,
        'address': address,
        'phone': phone,
      });

      // Thêm đối tượng Address vào danh sách _address
      Address newAddress = Address(
        id: newId,
        idUser: currentUser?.uid??"",
        fullname: fullname,
        status: true,
        addressText: address,
        phone: phone,
      );
      _address.add(newAddress);
    } catch (e) {
      print('Error adding new address: $e');
    }
  }

  static Future<void> deleteAddress(String addressId) async {
    try {
      await FirebaseFirestore.instance.collection('address').doc(addressId).delete();
      print('Deleted address with ID: $addressId');
    } catch (e) {
      print('Error deleting address: $e');
    }
  }
}