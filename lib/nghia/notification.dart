import 'package:flutter/material.dart';
import 'package:sales_application/khanh/bottom.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Thông báo',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<3;i++)
            
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/4,
              decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
              child:  
                // Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                      
                  // children: [
                Row(
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
                          "${title[i]}",
                          style: TextStyle(fontSize: 18),                              
                        ),
                        // SizedBox(height: 5,),
                        //message
                        Container(
                          height: MediaQuery.of(context).size.height/8,
                          width:  MediaQuery.of(context).size.width/1.4,
                          child: Text(
                          "${message[i]}",                            
                          style: TextStyle(fontSize: 15,),
                          softWrap: true, // Cho phép tự động xuống dòng
                          overflow: TextOverflow.clip, // Hiển thị toàn bộ văn bản, không bị cắt ngang
                        ),
                        )
                        
  
                      ],
                    )
                  ],
                ),
                  //]
              //),
            ),
              
             
            
          ]
        ),
      ),
      bottomNavigationBar:const Bottom_Nav(id:2) ,
    );
  }
}