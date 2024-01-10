import 'package:flutter/material.dart';
import 'package:sales_application/views/cancel_order.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CancelOrder()));
      }, 
      child: Text("Hủy đơn",style: TextStyle(color: Colors.black),),
      style:ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:BorderSide(color: Colors.black,width: 1), )),
        
    
      ),
      
    );
  }
}