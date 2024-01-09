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
      height: 220,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration:  BoxDecoration(
          color:  MyColor.light_grey,
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child: Container(
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: MyColor.dark_pink,
                    width: 1,
                  ),
                ),
                height: 120,
                width: 120,
                child: Text("Image"),
              )),

              Expanded(flex: 2,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child:  Text("Tên San Pham"), ),
                      Expanded(child:  Text("Giá"), ),
                      Expanded(child:  Text("Số lượng") )
                    ],)
                    ],

              ))
            ],
          ),flex: 2),
          Expanded(child: Row(
            children: [
              SizedBox(width: 10,),
              Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Xoá"))),
              SizedBox(width: 30,),
              Expanded(child: ElevatedButton(onPressed: (){}, child: Text("Sửa"))),
              SizedBox(width: 10,),
            ],
          ),flex: 1,)
        ],
      ),
    );
  }
}
