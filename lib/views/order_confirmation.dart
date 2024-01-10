import 'package:flutter/material.dart';
import 'package:sales_application/model/item_order_confirmation.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Xác nhận đơn hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
      ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            for(int i=0;i<3;i++)
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                width:MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
                child: Item_Confirm()
              ),
            
            
            
          ],
        ),
      ),
    );
  }
}