import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/model/buy_SelectedOption.dart';
import 'package:sales_application/model/buy_list.dart';
import 'package:sales_application/views/cart.dart';
import '../model/buy_bottom.dart';
import '../model/item_buy.dart';
import 'payment.dart';
import 'Voucher.dart';
class Buy_Screen extends StatefulWidget {
  const Buy_Screen({super.key});

  @override
  State<Buy_Screen> createState() => _Buy_ScreenState();
}

class _Buy_ScreenState extends State<Buy_Screen> {
  Color myColor = Color(0xFF8E1C68);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Mua hàng",style: TextStyle(color: myColor)),
      iconTheme: IconThemeData(color: myColor),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
       ),
       
       body: Padding(padding: const EdgeInsets.only(bottom: 1),
       child: Stack(
        children: [
          ListView(children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: const Text(
              'Tổng đơn hàng:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
  ListView.builder(
    padding: EdgeInsets.only(left: 20),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: 4,
    itemBuilder: (BuildContext context, int index) {
      return const item_buy (); 
    },
  ),
  const Divider( color: Colors.grey, thickness: 1),
  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Địa chỉ nhận hàng:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            maxLength: 150,
            decoration: const InputDecoration(
              hintText: 'Nhập địa chỉ của bạn',
              border: OutlineInputBorder(),
              
            ),
          ),
        ],
      ),
  ),
  Buy_SelectedOption(),
    const Divider( 
      color: Colors.grey, 
      thickness: 1, 
    ),
    Buy_List(),
]),
        ],
       ),),
       bottomNavigationBar:const buy_bottom()
      );
    
  }
}