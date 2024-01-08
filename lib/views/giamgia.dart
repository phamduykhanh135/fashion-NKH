import 'package:flutter/material.dart';
import 'package:sales_application/views/item_sl.dart';

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
        title: Text("Số lượng",style: TextStyle(color: Color.fromRGBO(142, 28, 104, 1),fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(248, 163, 193, 1),
        actions: [
          TextButton(onPressed: (){}, child: Text("Lưu",style: TextStyle(color: Color.fromRGBO(142, 28, 104, 1),fontWeight: FontWeight.bold)))
        ],

      ),
      body:  ItemSL()
    );
  }
}
