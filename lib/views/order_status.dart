import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:sales_application/model/item_order_status.dart';

class OrderStatus extends StatefulWidget {
  const OrderStatus({super.key});

  @override
  State<OrderStatus> createState() => _OrderStatusState();
}

class _OrderStatusState extends State<OrderStatus>with SingleTickerProviderStateMixin {
  TabController ?_tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink.shade100,//có thể thay đổi
        title: Text('Trạng thái đơn hàng',textAlign: TextAlign.center,style: TextStyle(color: Colors.purpleAccent.shade400,)),//thay doi
        centerTitle: true,// chỉnh titile ở giữa
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.purpleAccent.shade400,//thay doi
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0), // Chiều cao mong muốn của thanh TabBar
          child:Container(
            color: Colors.white,
            child:TabBar(
              controller: _tabController,
              indicatorColor: Colors.pink, // Màu sắc của đường line dưới văn bản khi chọn tab
              labelColor: Colors.pink, // Màu sắc của văn bản khi chọn tab
              unselectedLabelColor: Colors.black, // Màu sắc của văn bản khi không chọn tab
              
              tabs: [
                Tab(text: 'Chờ xác nhận'),
                Tab(text: 'Đang giao'),
                
              ],
            ),
          )
        )
      ),
      body:TabBarView(
        controller: _tabController,
        children: [
          // Nội dung của Tab Chờ xác nhận
          SingleChildScrollView(
            child: Column(
              children: [
                for(int i=0;i<1;i++)
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  width:MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/4+10,
                  decoration: BoxDecoration(color: Colors.grey.shade300 ,borderRadius: BorderRadius.circular(10)),
                  child: Item_StateOrder()
                ),
              ]
            )
          ),

          // Nội dung của Đang giao
          Container(
            child: Center(
              child:Column(
                mainAxisAlignment:MainAxisAlignment.center,
                children: [
                  Image.asset('assets/img/package.jpg',width: MediaQuery.of(context).size.width/2,height:  MediaQuery.of(context).size.height/2,),                  
                  Text("Không có sản phẩm nào")
                ],
              )
            ),
          ),
          
        ],
      ),
    );
  }
}