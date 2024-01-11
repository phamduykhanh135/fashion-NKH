import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/item_lsp.dart';
import 'package:sales_application/views/item_sl.dart';
import 'package:sales_application/views/serach_lsp.dart';
import 'package:sales_application/views/themsanpham.dart';

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
        leading: IconButton(onPressed: (){
          Navigator.push( context,
            MaterialPageRoute(builder: (context) => ThemSP()),);
        }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            ///Quần
            Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColor.light_grey,
                  width: 1.5,
                ),
              ),
            ),

            child: InkWell(
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => ThemSP()),);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(35,0, 0,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("Quần"),flex: 3),
                      Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )
            )
        ),
        ///Áo
        Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColor.light_grey,
                  width: 1.5,
                ),
              ),
            ),

            child: InkWell(
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => ThemSP()),);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(35,0, 0,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("Áo"),flex: 3),
                      Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )
            )
        ),
        ///Phụ kiện
        Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColor.light_grey,
                  width: 1.5,
                ),
              ),
            ),

            child: InkWell(
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => ThemSP()),);
                },
                child: Container(
                  padding: EdgeInsets.fromLTRB(35,0, 0,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Text("Phụ kiện"),flex: 3),
                      Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )
            )
        ),
          ],
        ),
      )
    );
  }
}
