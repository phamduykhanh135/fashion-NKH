import 'package:flutter/material.dart';
import '../model/bills.dart';

class Item_StateOrder extends StatefulWidget {
  const Item_StateOrder({super.key,required this.bill});
  final Bills bill;
  @override
  State<Item_StateOrder> createState() => _Item_StateOrderState();
}

class _Item_StateOrderState extends State<Item_StateOrder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Ảnh
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: MediaQuery.of(context).size.width/5,
              height: MediaQuery.of(context).size.height/6,
              child: Image.network("${widget.bill.url}",fit:BoxFit.cover)
            ),

            //Thông tin sản phẩm                      
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ 
                  //Tên sản phẩm
                  Text("${widget.bill.name}",style: TextStyle(fontSize: 18),),
                  //Đơn giá
                  Text("${widget.bill.price} đ",style: TextStyle(fontSize: 15,color: Colors.red),),
                  //Số lượng
                  Text("Số lượng: ${widget.bill.quantity}",style: TextStyle(fontSize: 15),),
                ]
              ),
            )
 
          ],
        ),
        //Thành tiền
        Container(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: Row(children: [
            Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
            Text("${widget.bill.total} đ",style: TextStyle(fontSize: 18,color: Colors.red),),
          ],),
        ),

      ]
    );
  }
}