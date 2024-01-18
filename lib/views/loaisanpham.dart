import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/item_lsp.dart';
import 'package:sales_application/views/item_sl.dart';
import 'package:sales_application/views/serach_lsp.dart';

class LoaiSP extends StatefulWidget {
  const LoaiSP({super.key});

  @override
  State<LoaiSP> createState() => _LoaiSPState();
}

class _LoaiSPState extends State<LoaiSP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loại sản phẩm",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          IconButton(onPressed: (){
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => SearchPage()),);
          }, icon: Icon(Icons.search,color:MyColor.dark_pink ,))
        ],
      ),
      body:  ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ItemLSP();
        },
      ),
    );
  }
}
