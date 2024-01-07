import 'package:flutter/material.dart';
import 'package:sales_application/views/item_qlsp.dart';

class QuanLySP extends StatefulWidget {
  const QuanLySP({super.key});

  @override
  State<QuanLySP> createState() => _QuanLySPState();
}

class _QuanLySPState extends State<QuanLySP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sản phẩm",style: TextStyle(color: Color.fromRGBO(142, 28, 104, 1),fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(248, 163, 193, 1),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color:Color.fromRGBO(142, 28, 104, 1),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.add,color:Color.fromRGBO(142, 28, 104, 1))),
        ],

      ),
      body: ItemSP(),
    );
  }
}
