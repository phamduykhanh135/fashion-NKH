import 'package:flutter/material.dart';
import 'package:sales_application/views/nghia/purchase_history.dart';

class Item_Manage1 extends StatefulWidget {
  const Item_Manage1({super.key});

  @override
  State<Item_Manage1> createState() => _Item_ManageState();
}

class _Item_ManageState extends State<Item_Manage1> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const PurchaseHistory()));
      },
      style:ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:const BorderSide(color: Colors.black,width: 1), )),
        
    
      ), 
      child: const Text("Lịch sử mua hàng",style: TextStyle(color: Colors.black),),
      
    );
  }
}