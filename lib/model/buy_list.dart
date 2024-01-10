import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Buy_List extends StatelessWidget {
  const Buy_List({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Text("Tổng tiền hàng:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ],),
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Text("Tổng chi phí vận chuyển:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ],),
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Text("Giảm giá phí vận chuyển:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ],),
                SizedBox(height: 5,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  Text("Thành tiền:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                  Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                ],)
],
        
      ),
    );
  }
}