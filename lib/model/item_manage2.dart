import 'package:flutter/material.dart';
import 'package:sales_application/views/order_status.dart';

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
        Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderStatus()));
      }, 
      child: Text("Trạng thái đơn hàng",style: TextStyle(color: Colors.black),),
      style:ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:BorderSide(color: Colors.black,width: 1), )),
        
    
      ),
      
    );
  }
}