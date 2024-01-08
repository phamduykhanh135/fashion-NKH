import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/kien/cart.dart';
import './item_buy.dart';
import './payment.dart';
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
       
       body: Padding(padding: EdgeInsets.only(bottom: 1),
       child: Stack(
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
    itemCount: 4,
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
      const Text("Phương thức thanh toán",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
      
      IconButton(onPressed: (){
        Navigator.push( context,
              MaterialPageRoute(builder: (context) => Payment_Screen()),);
      }, icon: Icon(Icons.arrow_forward_ios)),
    ],),
    const Divider( 
      color: Colors.grey,
      thickness: 1, 
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      Text("Chọn voucher",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

      IconButton(onPressed: (){
         Navigator.push( context,
              MaterialPageRoute(builder: (context) => Voucher()),);
      }, icon: Icon(Icons.arrow_forward_ios)),
    ],),
    const Divider( 
      color: Colors.grey, 
      thickness: 1, 
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Tổng tiền hàng:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
      Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
    ],),
    SizedBox(height: 5,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Tổng chi phí vận chuyển:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
      Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
    ],),
    SizedBox(height: 5,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Giảm giá phí vận chuyển:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
      Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
    ],),
    SizedBox(height: 5,),
    Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
      Text("Thành tiền:",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
      Text("0 đ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
    ],)
]),
        ],
       ),),
       bottomNavigationBar: Container(
        height: 60, 
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text("Tổng tiền",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  Text("100.000VND",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)), 
                ],  
              ),
            
              
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pink.shade100),
                  minimumSize: MaterialStateProperty.all(const Size(120, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  
                },
                child: Text(
                  'Thanh toán',
                  style: TextStyle(color: myColor,fontSize: 18),
                ),
              ),
            ],
          ),
            
          )
        ),
      );
    
  }
}