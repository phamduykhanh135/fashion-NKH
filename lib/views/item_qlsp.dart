import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/suasanpham.dart';

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
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
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

              Expanded(
                flex: 1,
                  child: Row(
                    children: [
                      SizedBox(width: 20,),
                    Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(child:  Text("Tên San Pham",softWrap: true,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),overflow: TextOverflow.visible,),),
                      RichText(
                        text: TextSpan(
                          text: null,
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(text: 'Giá: ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                            TextSpan(text: '100000', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                            TextSpan(text: 'đ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          text: null,
                          style: DefaultTextStyle.of(context).style,
                          children: <TextSpan>[
                            TextSpan(text: 'Số lượng: ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                            TextSpan(text: '30', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,decoration: TextDecoration.none,)),
                          ],
                        ),
                      )
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
              Expanded(child: ElevatedButton(onPressed: (){
                Navigator.push( context,
                  MaterialPageRoute(builder: (context) => SuaSP()),);
              }, child: Text("Sửa"))),
              SizedBox(width: 10,),
            ],
          ),flex: 1,)
        ],
      ),
    );
  }
}
