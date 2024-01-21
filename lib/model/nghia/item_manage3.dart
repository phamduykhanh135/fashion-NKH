import 'package:flutter/material.dart';
import 'package:sales_application/views/nghia/cancel_order.dart';

class Item_Manage3 extends StatefulWidget {
  const Item_Manage3({super.key});

  @override
  State<Item_Manage3> createState() => _Item_Manage3State();
}

class _Item_Manage3State extends State<Item_Manage3> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const CancelOrder()));
      },
      style:ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:const BorderSide(color: Colors.black,width: 1), )),
        
    
      ), 
      child: const Text("Hủy đơn",style: TextStyle(color: Colors.black),),
      
    );
  }
}
