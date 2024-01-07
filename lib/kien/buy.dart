import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './item_buy.dart';
import './payment.dart';
import 'Voucher.dart';
class Buy_Screen extends StatefulWidget {
  const Buy_Screen({super.key});

  @override
  State<Buy_Screen> createState() => _Buy_ScreenState();
}

class _Buy_ScreenState extends State<Buy_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Mua hàng",textAlign: TextAlign.center,),),
       body: Stack(
        children: [
          
          ListView(children: [
  Container(
    padding: EdgeInsets.all(8.0),
    child: Text(
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
    itemCount: 3,
    itemBuilder: (BuildContext context, int index) {
      return const item_buy (); 
    },
  ),
  const Divider( // Đường gạch chân dưới
      color: Colors.grey, // Màu sắc của gạch chân
      thickness: 1, // Độ dày của gạch chân
    ),
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
  const Divider( // Đường gạch chân dưới
      color: Colors.grey, // Màu sắc của gạch chân
      thickness: 1, // Độ dày của gạch chân
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      const Text("Phương thức thanh toán"),
      
      IconButton(onPressed: (){
        Navigator.push( context,
              MaterialPageRoute(builder: (context) => Payment_Screen()),);
      }, icon: Icon(Icons.arrow_forward_ios)),
    ],),
    const Divider( // Đường gạch chân dưới
      color: Colors.grey, // Màu sắc của gạch chân
      thickness: 1, // Độ dày của gạch chân
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Chọn voucher"),

      IconButton(onPressed: (){
         Navigator.push( context,
              MaterialPageRoute(builder: (context) => Voucher()),);
      }, icon: Icon(Icons.arrow_forward_ios)),
    ],),
    const Divider( // Đường gạch chân dưới
      color: Colors.grey, // Màu sắc của gạch chân
      thickness: 1, // Độ dày của gạch chân
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Tổng tiền hàng:"),
      Text("0 đ"),
    ],),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Tổng chi phí vận chuyển:"),
      Text("0 đ"),
    ],),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Giảm giá phí vận chuyển:"),
      Text("0 đ"),
    ],),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Thành tiền:"),
      Text("0 đ"),
    ],)
]),
            Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 60, // Điều chỉnh chiều cao của thanh dưới cùng
              color: Colors.white,
              child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(children: [
                    Text("Tổng tiền:",style: TextStyle(color: Colors.black,fontSize: 18),),
                    Text("100000VND",style: TextStyle(color: Colors.black,fontSize: 18)),
                  ],),

                  ElevatedButton(
                    
                    onPressed: () {
                      // Xử lý khi người dùng nhấn nút
                    },
                    child: const Text('Thanh toán'),
                  ),
                ],
              ),
            ),
          ),

        ],
       ),
    );
  }
}