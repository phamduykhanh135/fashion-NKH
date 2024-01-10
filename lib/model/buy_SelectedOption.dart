import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../views/Voucher.dart';
import '../views/payment.dart';

class Buy_SelectedOption extends StatelessWidget {
  const Buy_SelectedOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: [
              const Divider( color: Colors.grey, thickness: 1),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      const Text("Phương thức thanh toán",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
      
      IconButton(onPressed: (){
        Navigator.push( context,
              MaterialPageRoute(builder: (context) => Payment_Screen()),);
      }, icon: Icon(Icons.arrow_forward_ios)),
    ],),
    const Divider( color: Colors.grey,thickness: 1),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Chọn voucher",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      IconButton(onPressed: (){
         Navigator.push( context,
              MaterialPageRoute(builder: (context) => Voucher()),);
      }, icon: Icon(Icons.arrow_forward_ios)),
    ],),
],
        
      ),
    );
  }
}