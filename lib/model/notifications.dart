import 'dart:convert';
import 'db_reader.dart';

class Notificates{
  int id;
  String title;
  String message;
  String url_img;

  Notificates(this.id,this.title,this.message,this.url_img);

  Notificates.fromJson(Map<String,dynamic>json)
      : id=json['id'],
        title=json['title'],
        message=json['message'],
        url_img=json['url_img'];
        

  static List<Notificates>notificates=List.filled(0,Notificates(0,'','',''),growable: true);
  static Future<void> loadData() async{
    InfoReaderNotificates reader=InfoReaderNotificates();
    String data=await reader.getInfo();
    List<dynamic> lst=jsonDecode(data);
    for(var entry in lst){
      notificates.add(Notificates.fromJson(entry));
    }
  }
}