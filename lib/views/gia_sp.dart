import 'package:flutter/material.dart';
import 'package:sales_application/views/item_sl.dart';

import 'color.dart';

class GiaSP extends StatefulWidget {
  const GiaSP({super.key});

  @override
  State<GiaSP> createState() => _GiaSPState();
}

class _GiaSPState extends State<GiaSP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giá bán",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
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
