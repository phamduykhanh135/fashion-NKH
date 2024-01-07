import 'package:flutter/material.dart';

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
          color:  Color.fromRGBO(243, 243, 243, 1),
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
                    color: Color.fromRGBO(142, 28, 104, 1),
                    width: 1,
                  ),
                ),
                height: 120,
                width: 120,
                child: Text("Image"),
              )),
              Expanded(flex: 2,child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text("Tên San Pham"),
                Text("Giá"),
                Text("Số lượng")
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
