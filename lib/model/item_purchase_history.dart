import 'package:flutter/material.dart';

class Item_History extends StatefulWidget {
  const Item_History({super.key});

  @override
  State<Item_History> createState() => _Item_HistoryState();
}

class _Item_HistoryState extends State<Item_History> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Ảnh
            Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
              width: MediaQuery.of(context).size.width/5,
              height: 120,
              child: Image.asset('assets/img/quanjean.jpg')
            ),

            //Thông tin sản phẩm                      
            Container(
              padding: EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                //Tên sản phẩm
                Text("Quần Jean nam xanh",style: TextStyle(fontSize: 18),),
                //Đơn giá
                Text("299.000 đ",style: TextStyle(fontSize: 15,color: Colors.red),),
                //Số lượng
                Text("Số lượng: 1",style: TextStyle(fontSize: 15),),
              ]),
            )

          ],
        ),
        //Thành tiền
        Container(
          margin: EdgeInsets.fromLTRB(10, 15, 10, 5),
          child: Row(children: [
            Text("Thành tiền: ",style: TextStyle(fontSize: 18,),),
            Text("299.000 đ",style: TextStyle(fontSize: 18,color: Colors.red),),
          ],),
        ),
        
        
      ]
    );
  }
}