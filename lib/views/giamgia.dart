import 'package:flutter/material.dart';
import 'package:sales_application/views/item_sl.dart';
import 'package:sales_application/views/color.dart';
class GiamGia extends StatefulWidget {
  const GiamGia({super.key});

  @override
  State<GiamGia> createState() => _GiamGiaState();
}

class _GiamGiaState extends State<GiamGia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Số lượng",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          TextButton(onPressed: (){}, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
        ],

      ),
      body:  ItemSL()
    );
  }
}
