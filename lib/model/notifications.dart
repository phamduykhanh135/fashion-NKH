import 'package:cloud_firestore/cloud_firestore.dart';

class Notificates {
  String id;
  String message;
  String title;
  String url_img;

  Notificates({
    required this.id,
    required this.message,
    required this.title,
    required this.url_img,
    
  });

  factory Notificates.fromJson(Map<String, dynamic> json) => Notificates(
        id: json["id"] ?? '',       
        message: json['message']??'',
        title: json['title']??'',
        url_img: json['url_img']??'',
      );

  static List<Notificates> notificates = [];

  static FirebaseFirestore firestore = FirebaseFirestore.instance;
  
  static Future<void> loadNotificates() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firestore.collection('notificates').get();

      List<Notificates> loadedNotificates = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data();
        return Notificates.fromJson(data);
      }).toList();

      // Gán danh sách Notificates đã load vào biến Notificates
      notificates = loadedNotificates;
    } catch (error) {
      print('Error loading Notificates: $error');
    }
  }
}