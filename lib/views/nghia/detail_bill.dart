import 'package:flutter/material.dart';
import 'package:sales_application/model/nghia/bills.dart';
class Detail_bill extends StatefulWidget {
  const Detail_bill({super.key,required this.bill}) ;
  final Bills bill;
  @override
  State<Detail_bill> createState() => _Detail_billState();
}

class _Detail_billState extends State<Detail_bill> {

  @override
  Widget build(BuildContext context) {
    int n=widget.bill.items.length;
    return FutureBuilder(
      future: Bills.loadBills(),
      builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }

      if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      }

      return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,
        title: Text(
          'Chi tiết đơn hàng',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.purpleAccent.shade400),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
          for(int i=0;i<n;i++)
          
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4 + 10,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
            child:Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [                   
                    //Ảnh
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                      width: MediaQuery.of(context).size.width/5,
                      height: MediaQuery.of(context).size.height/6,
                      child: Image.network("${widget.bill.items[i]['image']}",fit:BoxFit.cover)
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
                            child:Text("${widget.bill.items[i]['name']}",style: const TextStyle(fontSize: 18),softWrap: true,overflow:TextOverflow.clip ,),
                          ),
                          //Đơn giá
                          Text("${widget.bill.items[i]['price']} đ",style: const TextStyle(fontSize: 15,color: Colors.red),),
                          //Số lượng
                          Text("Số lượng: ${widget.bill.items[i]['quality']}",style: const TextStyle(fontSize: 15),),
                          //Size
                          Text("Size: ${widget.bill.items[i]['size']}",style: const TextStyle(fontSize: 15),),
                        ]
                      ),
                    )     
                  ],
                ),
              ]
            )
          ),
        //Thành tiền
        Container(
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
            Text("${widget.bill.totalAmount} đ",style: const TextStyle(fontSize: 18,color: Colors.red),),
          ],),
        ),
          ]
        )
                
                        
                
      ),
      );
      },
    );
  }
}