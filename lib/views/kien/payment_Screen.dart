import 'package:flutter/material.dart';


class Payment_Screen extends StatefulWidget {
  const Payment_Screen({super.key});

  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
  Color myColor = const Color(0xFF8E1C68);
  int _select=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Phương thức thanh toán",style: TextStyle(color: myColor)),
       iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
       ),
    body: ListView(children: [
      RadioListTile(
        tileColor: Colors.white, 
        activeColor: Colors.pink.shade100, 
        title: const Text("Thanh toán ngay khi nhận hàng"),
        value: 1, groupValue: _select, onChanged: (value){
          setState(() {
            _select=value!;
          });
        }
        ),
      
    ]),

    );
  }
}