import 'package:flutter/material.dart';
import 'package:sales_application/data/nghia/bills.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Item_Cancel extends StatefulWidget {
  const Item_Cancel({super.key,required this.bill});
  final Bills bill;
  
  @override
  State<Item_Cancel> createState() => _Item_CancelState();
}

class _Item_CancelState extends State<Item_Cancel> {
  void updateCancelState() async {
     if (!mounted) {
      return; // Tránh thực hiện tác vụ nếu State đã bị hủy
    }
    if (mounted) {
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: const BorderSide(width: 1,color: Colors.black)),                                   
          content:const Text("Hủy đơn hàng thành công",textAlign: TextAlign.center,) ,
          actions: [
            Center(
              child: ElevatedButton(
                onPressed:(){ Navigator.of(context).pop();},
                
                style:ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),
                  
                ), 
                child: Text("OK",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
              

              )
            )
          ],
        );
      }
    );
    }
    try {
      await Bills.firestore
          .collection('invoices')
          .doc(widget.bill.mahd)
          .update({'cancel_state': true});
      print('Đã cập nhật trạng thái hủy thành công');
    } catch (error) {
      print('Lỗi khi cập nhật trạng thái hủy: $error');
    }
  }
  
  
  @override
  Widget build(BuildContext context) {
    // return StreamBuilder(
    //   stream: FirebaseFirestore.instance.collection('invoices').snapshots(),
    //   builder: (context, snapshot) {
    //   if (!snapshot.hasData) {
    //     return CircularProgressIndicator(); // hoặc một widget loading khác
    //   }
    
      return 
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Ảnh
                Container(
                  margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: MediaQuery.of(context).size.width/5,
                  height: MediaQuery.of(context).size.height/6,
                  child: Image.network("${widget.bill.items[0]['image']}",fit:BoxFit.cover)
                ),
                
                //Thông tin sản phẩm                      
                Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [ 
                      //Tên sản phẩm
                      SizedBox(
                        height: MediaQuery.of(context).size.height/12,
                        width: MediaQuery.of(context).size.width/2,
                        child:Text("${widget.bill.items[0]['name']}",style: const TextStyle(fontSize: 18),softWrap: true,overflow:TextOverflow.clip ,),
                      ),
                      
                      //Đơn giá
                      Text("${widget.bill.items[0]['price']} đ",style: const TextStyle(fontSize: 15,color: Colors.red),),
                      //Số lượng
                      Text("Số lượng: ${widget.bill.items[0]['quality']}",style: const TextStyle(fontSize: 15),),
                      //Size
                      Text("Size: ${widget.bill.items[0]['size']}",style: const TextStyle(fontSize: 15),),
                    ]
                  ),
                )
              ],
            ),
        
            //Thành tiền
            Container(
              margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
              child: Row(children: [
                const Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
                Text("${widget.bill.totalAmount} đ",style: const TextStyle(fontSize: 18,color: Colors.red),),
              ],),
            ),

            //Button xác nhận hủy
            Container(
              margin: const EdgeInsets.all(5),
              
              child:Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Trang thai huy              
                  ElevatedButton(
                    onPressed: updateCancelState,
                    style:ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100), //thay đổi
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),)),

                    ),                     
                    child: Text("Xác nhận hủy",style: TextStyle(color: Colors.purpleAccent.shade400,fontSize: 15),),
                  ) 
                  
                
                ],
              )
            )
          ]
        );
      //}
    //);
  }
}