import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Payment_Screen extends StatefulWidget {
  const Payment_Screen({super.key});

  @override
  State<Payment_Screen> createState() => _Payment_ScreenState();
}

class _Payment_ScreenState extends State<Payment_Screen> {
  int _select=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Phương thức thanh toán"),),
    body: ListView(children: [
      RadioListTile(
        title: Text("Thanh toán ngay khi nhận hàng"),
        value: 1, groupValue: _select, onChanged: (value){
          setState(() {
            _select=value!;
          });
        }
        ),
        RadioListTile(
          title: Text("Thanh toán qua ví online"),
        value: 2, groupValue: _select, onChanged: (value){
          setState(() {
            _select=value!;
          });
        }
        )
    ]),

    );
  }
}