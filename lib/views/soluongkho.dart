import 'package:flutter/material.dart';
import 'package:sales_application/views/item_sl.dart';

class SoLuongKho extends StatefulWidget {
  const SoLuongKho({super.key});

  @override
  State<SoLuongKho> createState() => _SoLuongKhoState();
}

class _SoLuongKhoState extends State<SoLuongKho> {
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
      body:  ListView.builder(
        itemCount: 4, // Số lượng phần tử trong danh sách
        itemBuilder: (BuildContext context, int index) {
          // Hàm này được gọi mỗi khi một phần tử cần được hiển thị
          return ItemSL();
        },
      ),
    );
  }
}
