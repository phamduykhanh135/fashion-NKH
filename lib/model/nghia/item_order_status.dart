import 'package:flutter/material.dart';
import 'package:sales_application/data/nghia/bills.dart';

class Item_StateOrder extends StatefulWidget {
  const Item_StateOrder({Key? key, required this.bill}) : super(key: key);
  final Bills bill;
  @override
  State<Item_StateOrder> createState() => _Item_StateOrderState();
}

class _Item_StateOrderState extends State<Item_StateOrder> {
  @override
  Widget build(BuildContext context) {
  
    return FutureBuilder(
      future: Bills.loadBills(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      return Column(
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
        // }),
        //Thành tiền
        Container(
          margin: const EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: Row(children: [
            const Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
            Text("${widget.bill.totalAmount} đ",style: const TextStyle(fontSize: 18,color: Colors.red),),
          ],),
        ),

      ]
    );
    },
    );
  }
}