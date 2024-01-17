import 'dart:convert';
import 'db_reader.dart';

class Bills{
  int id;
  String name;
  int price;
  int quantity;
  int total;
  String url;
  bool bill_state;
  bool confirm_state;
  bool cancel_state;

  Bills(this.id,this.name,this.price,this.quantity,this.total,this.url,this.bill_state,this.confirm_state,this.cancel_state);

  Bills.fromJson(Map<String,dynamic>json)
      : id=json['id'],
        name=json['name'],
        price=json['price'],
        quantity=json['quantity'],
        total=json['total'],
        url=json['url_img'],
        bill_state=json['bill_state'],
        confirm_state=json['confirm_state'],
        cancel_state=json['cancel_state'];


  static List<Bills>bills=List.filled(0,Bills(0,'',0,0,0,'',false,false,false),growable: true);
  static Future<void> loadData() async{
    InfoReaderBills reader=InfoReaderBills();
    String data=await reader.getInfo();
    List<dynamic> lst=jsonDecode(data);
    for(var entry in lst){
      bills.add(Bills.fromJson(entry));
    }
  }
}