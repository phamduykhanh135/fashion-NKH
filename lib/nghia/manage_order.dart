import 'package:flutter/material.dart';
import 'package:sales_application/khanh/bottom.dart';

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
          Container(
            margin: EdgeInsets.fromLTRB(0,10,0,5),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){}, 
              child: Text("Lịch sử mua hàng",style: TextStyle(color: Colors.black),),
              style:ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:BorderSide(color: Colors.black,width: 1), )),
               
            
              ),
              
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0,5,0,5),
            width: double.infinity,
            height: 50,
            child:  ElevatedButton(
              onPressed: (){}, 
              child: Text("Trạng thái đơn hàng",style: TextStyle(color: Colors.black),),
              style:ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:BorderSide(color: Colors.black,width: 1), )),
               
            
              ),
              
            ),
            
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0,5,0,10),
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){}, 
              child: Text("Hủy đơn",style: TextStyle(color: Colors.black),),
              style:ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Colors.white),//thay đổi
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30),side:BorderSide(color: Colors.black,width: 1), )),
               
            
              ),
              
            ),
          )

        ],
      ),
      bottomNavigationBar:const Bottom_Nav(id:2) ,
    );
  }
}