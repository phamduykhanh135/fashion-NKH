import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/item_qlsp.dart';
import 'package:sales_application/views/search_qlsp.dart';
import 'package:sales_application/views/themsanpham.dart';

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
        title: Text("Quản lý sản phẩm", style: TextStyle(
            color: MyColor.dark_pink, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          IconButton(onPressed: () {
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => const SearchPage()),);
          }, icon: Icon(Icons.search, color: MyColor.dark_pink,)),
          IconButton(onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ThemSP()),);
          }, icon: Icon(Icons.add, color: MyColor.dark_pink)),
        ],
      ),
      body: ListView.builder(
        itemCount: 10, // Số lượng phần tử trong danh sách
        itemBuilder: (BuildContext context, int index) {
          // Hàm này được gọi mỗi khi một phần tử cần được hiển thị
          return const ItemSP();
        },
      ),
    );
  }

}