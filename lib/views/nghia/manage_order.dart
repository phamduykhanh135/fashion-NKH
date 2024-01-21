import 'package:flutter/material.dart';


import 'package:sales_application/model/nghia/item_manage1.dart';
import 'package:sales_application/model/nghia/item_manage2.dart';
import 'package:sales_application/model/nghia/item_manage3.dart';

class Manage_order extends StatefulWidget {
  const Manage_order({super.key});

  @override
  State<Manage_order> createState() => _Manage_orderState();
}

class _Manage_orderState extends State<Manage_order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Quản lý đơn hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        
        children:[
          //Lich su 
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,5),
            width: double.infinity,
            height: 50,
            child: Item_Manage1()
          ),
          //Trang thai
          Container(
            margin: EdgeInsets.fromLTRB(0,5,0,5),
            width: double.infinity,
            height: 50,
            child:  Item_Manage2()
            
          ),
          //Huy don
          Container(
            margin: EdgeInsets.fromLTRB(0,5,0,10),
            width: double.infinity,
            height: 50,
            child: Item_Manage3()
          )

        ],
      ),
      // bottomNavigationBar:const Bottom_Nav(id:2) ,
    );
  }
}