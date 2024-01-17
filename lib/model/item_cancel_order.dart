import 'package:flutter/material.dart';
import '../model/bills.dart';

class Item_Cancel extends StatefulWidget {
  const Item_Cancel({super.key,required this.bill});
  final Bills bill;
  
  @override
  State<Item_Cancel> createState() => _Item_CancelState();
}

class _Item_CancelState extends State<Item_Cancel> {
  bool canceledState=false;
  void cancel_state() {
  setState(() {
    canceledState=true;
  });
  showDialog(
    context: context, 
    builder: (BuildContext context){
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(width: 1,color: Colors.black)),                                   
        content:Text("Hủy đơn hàng thành công",textAlign: TextAlign.center,) ,
        actions: [
          Center(
            child: ElevatedButton(
              onPressed:(){ Navigator.of(context).pop();}, 
              child: Text("OK",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
              
              style:ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),
                
              ),
            

            )
          )
        ],
      );
    }
  );
}
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
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(children: [
            Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
            Text("${widget.bill.total} đ",style: TextStyle(fontSize: 18,color: Colors.red),),
          ],),
        ),
        //Xác nhận hủy
        Container(
          margin: EdgeInsets.all(5),
          
          child:Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              canceledState==false?//Trang thai huy              
              ElevatedButton(
                onPressed: cancel_state,
                 
                
                child: Text("Xác nhận hủy",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
                style:ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),

                ),
              ) :
              Text("Đã hủy",style: TextStyle(color:Colors.red,fontSize: 15),)
              
            
            ],
          )
        )
      ]
    );
  }
}