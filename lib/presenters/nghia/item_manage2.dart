import 'package:flutter/material.dart';
import 'package:sales_application/views/nghia/order_status.dart';

class Item_Manage2 extends StatefulWidget {
  const Item_Manage2({super.key});

  @override
  State<Item_Manage2> createState() => _Item_Manage2State();
}

class _Item_Manage2State extends State<Item_Manage2> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const OrderStatus()));
      },
      style:ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:const BorderSide(color: Colors.black,width: 1), )),
        
    
      ), 
      child: const Text("Trạng thái đơn hàng",style: TextStyle(color: Colors.black),),
      
    );
  }
}