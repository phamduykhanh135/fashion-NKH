import 'package:flutter/material.dart';

class Item_Notification extends StatefulWidget {
  const Item_Notification({super.key,required this.i});
  final i;

  @override
  State<Item_Notification> createState() => _Item_NotificationState();
}

class _Item_NotificationState extends State<Item_Notification> {
  
  //title
  List<String> title=[
    'Đã xác nhận',
    'Đang giao',
    'Giao hàng thành công'
  ];
  //message
  List<String> message=[
    'Đơn hàng của bạn đã được xác nhận',
    'Đơn hàng của bạn đang trên đường giao đến bạn, vui lòng chú ý đến thông tin giao hàng',
    'Đơn hàng của bạn đã được giao đến bạn'
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Ảnh
        Container(
          
          width: MediaQuery.of(context).size.width/5,
          height:MediaQuery.of(context).size.height/10,
          child: Image.asset('assets/img/quanjean.jpg')
        ),

        //Thông tin sản phẩm
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [    
            //title                     
            Text(
              "${title[widget.i]}",
              style: TextStyle(fontSize: 18),                              
            ),
            // SizedBox(height: 5,),
            //message
            Container(
              height: MediaQuery.of(context).size.height/8,
              width:  MediaQuery.of(context).size.width/1.4,
              child: Text(
              "${message[widget.i]}",                            
              style: TextStyle(fontSize: 15,),
              softWrap: true, // Cho phép tự động xuống dòng
              overflow: TextOverflow.clip, // Hiển thị toàn bộ văn bản, không bị cắt ngang
            ),
            )
            

          ],
        )
      ],
    );
  }
}