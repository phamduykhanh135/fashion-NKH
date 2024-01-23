import 'package:flutter/material.dart';
import 'package:sales_application/models/nghia/bills.dart';
import 'package:sales_application/models/nghia/notifications.dart';
class Item_Notification extends StatefulWidget {
  const Item_Notification({super.key,required this.notificate});
  final Notificates notificate;

  @override
  State<Item_Notification> createState() => _Item_NotificationState();
}

class _Item_NotificationState extends State<Item_Notification> {
 
  @override
  Widget build(BuildContext context) {


    return
    FutureBuilder(
      future: Bills.loadBills(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Ảnh
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            width: MediaQuery.of(context).size.width/5-10,
            height: MediaQuery.of(context).size.height/6-10,
            child: Image.network(widget.notificate.url_img,fit:BoxFit.cover)
          ),

          //Thông tin sản phẩm
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          
            children: [              
              //title                     
              Text(
                widget.notificate.title,
                style: const TextStyle(fontSize: 18),                              
              ),
              // SizedBox(height: 5,),
              //message
              SizedBox(
                height: MediaQuery.of(context).size.height/8,
                width:  MediaQuery.of(context).size.width/1.4,
                child: Text(
                widget.notificate.message,                            
                style: const TextStyle(fontSize: 15,),
                softWrap: true, // Cho phép tự động xuống dòng
                overflow: TextOverflow.clip, // Hiển thị toàn bộ văn bản, không bị cắt ngang
              ),
              )
            ],
          )
        ],
      );
      }
    );
  }
}