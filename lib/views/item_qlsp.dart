import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';

class ItemSP extends StatefulWidget {
  const ItemSP({super.key});

  @override
  State<ItemSP> createState() => _ItemSPState();
}

class _ItemSPState extends State<ItemSP> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration:  BoxDecoration(
          color:  MyColor.light_grey,
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          Expanded(flex: 2, child: Row(
            children: [
              Expanded(child: Container(
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: MyColor.dark_pink,
                    width: 1,
                  ),
                ),
                height: double.maxFinite,
                width: double.maxFinite,
                child: SizedBox(
                  width: double.maxFinite,height: double.maxFinite,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0), // Điều chỉnh góc bo tròn tại đây
                    child:
                      Image.network("https://cdn2.yame.vn/pimg/ao-thun-co-tron-on-gian-y-nguyen-ban-ver138-0021880/42de6a30-3f43-2a00-09ec-001a2d767a97.jpg?w=540&h=756",
                        fit: BoxFit.cover,),
                    ),
                  ),
                )
              ),

              const Expanded(
                flex: 1,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 2,child:  Text("Tên San Pham"),),
                      Expanded(child:  Text("Giá"), ),
                      Expanded(child:  Text("Số lượng") )
                    ],)
                    ],

              ))
            ],
          )),
          Expanded(flex: 1,child: Row(
            children: [
              const SizedBox(width: 10,),
              Expanded(child: ElevatedButton(onPressed: (){}, child: const Text("Xoá"))),
              const SizedBox(width: 30,),
              Expanded(child: ElevatedButton(onPressed: (){}, child: const Text("Sửa"))),
              const SizedBox(width: 10,),
            ],
          ),)
        ],
      ),
    );
  }
}
