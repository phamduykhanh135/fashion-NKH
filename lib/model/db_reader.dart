import 'package:flutter/services.dart';

class InfoReaderBills{
  Future<String> getInfo() async{
    String s="";
    try{
      s=await rootBundle.loadString('data/bills.json');
      return (s);
    }catch(e){
      return e.toString();
    }
  }
}
class InfoReaderNotificates{
  Future<String> getInfo() async{
    String s="";
    try{
      s=await rootBundle.loadString('data/notifications.json');
      return (s);
    }catch(e){
      return e.toString();
    }
  }
}