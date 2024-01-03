import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './item_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool ischeck=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: const Text("Giỏ hàng"),),
       body: Stack(
        children: [
          ListView(children: [ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              return Item_cart();
            },
          ),],),
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Container(
              height: 30, // Điều chỉnh chiều cao của thanh dưới cùng
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: const [
                  
                  Text(
                    'Tổng tiền:', // Thay đổi nội dung theo nhu cầu của bạn
                    style: TextStyle(color: Colors.black,fontSize: 13),
                  ),
                  Text(
                    '100000đ', // Thay đổi nội dung theo nhu cầu của bạn
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
            Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50, // Điều chỉnh chiều cao của thanh dưới cùng
              color: Colors.white,
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(value: ischeck, onChanged: (bool? value){
          setState(() {
            ischeck = value!;
          });
        }),
        Text("tất cả"),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi người dùng nhấn nút
                    },
                    child: Text('Thanh toán'),
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