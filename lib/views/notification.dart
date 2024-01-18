import 'package:flutter/material.dart';
import 'package:sales_application/model/item_notification.dart';
import 'package:sales_application/presenter/bottom.dart';
import '../model/notifications.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Notificates> notificates=[];
  void _loadData() async {
    await Notificates.loadNotificates();
    setState(() {
      notificates = Notificates.notificates;
    });
  }

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  @override
  void dispose() {
  
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
     int n = notificates.length; 
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Thông báo',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i=n-1;i>=0;i--)
            
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
              child: Item_Notification(notificate: notificates[i],)
                
            ),
              
             
            
          ]
        ),
      ),
      bottomNavigationBar:const Bottom_Nav(id:2) ,
    );
  }
}