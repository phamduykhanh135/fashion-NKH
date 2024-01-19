import 'package:flutter/material.dart';
import '../model/bills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Item_Confirm extends StatefulWidget {
  const Item_Confirm({super.key,required this.bill});
  final Bills bill;
  @override
  State<Item_Confirm> createState() => _Item_ConfirmState();
}

class _Item_ConfirmState extends State<Item_Confirm> {

  void updateConfirmState() async {
    try {
      await Bills.firestore
          .collection('invoices')
          .doc(widget.bill.mahd)
          .update({'confirm_state': true});
      print('Đã cập nhật trạng thái hủy thành công');
    } catch (error) {
      print('Lỗi khi cập nhật trạng thái hủy: $error');
    }
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(width: 1,color: Colors.black)),                                   
          content:Text("Xác nhận đơn thành công",textAlign: TextAlign.center,) ,
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
    return FutureBuilder(
      future: Bills.loadBills(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return CircularProgressIndicator();
      }

      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      return
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Ảnh
                Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width/5,
                  height: MediaQuery.of(context).size.height/6,
                  child: Image.network("${widget.bill.items[0]['image']}",fit:BoxFit.cover)
                ),
                
                //Thông tin sản phẩm                      
                Container(
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      //Tên sản phẩm
                      Container(
                        height: MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width/2,
                        child:Text("${widget.bill.items[0]['name']}",style: TextStyle(fontSize: 18),softWrap: true,overflow:TextOverflow.ellipsis ,),
                      ),
                      //Đơn giá
                      Text("${widget.bill.items[0]['price']} đ",style: TextStyle(fontSize: 15,color: Colors.red),),
                      //Số lượng
                      Text("Số lượng: ${widget.bill.items[0]['quality']}",style: TextStyle(fontSize: 15),),
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
                Text("${widget.bill.totalAmount} đ",style: TextStyle(fontSize: 18,color: Colors.red),),
              ],),
            ),

            //Button xác nhận hủy
            Container(
              margin: EdgeInsets.all(5),
              
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Trang thai huy              
                  ElevatedButton(
                    onPressed: updateConfirmState,                     
                    child: Text("Xác nhận đơn",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
                    style:ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),

                    ),
                  ) 
                  
                
                ],
              )
            )
          ]
        );
      }
    );
  }
}