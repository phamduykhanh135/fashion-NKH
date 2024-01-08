import 'package:flutter/material.dart';
import 'package:sales_application/views/item_lsp.dart';
import 'package:sales_application/views/item_sl.dart';

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
        title: Text("Loại sản phẩm",style: TextStyle(color: Color.fromRGBO(142, 28, 104, 1),fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(248, 163, 193, 1),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color:Color.fromRGBO(142, 28, 104, 1) ,))
        ],
      ),
      body:  ListView.builder(
        itemCount: 10, // Số lượng phần tử trong danh sách
        itemBuilder: (BuildContext context, int index) {
          // Hàm này được gọi mỗi khi một phần tử cần được hiển thị
          return ItemLSP();
        },
      ),
    );
  }
}
