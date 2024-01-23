import 'package:flutter/material.dart';
import 'package:sales_application/models/kien/cart_Reader.dart';
import 'package:sales_application/models/kien/payment_Reader.dart';

import '../../views/kien/buy_Sceen.dart';

class Cart_ElevatedButton extends StatelessWidget {
  const Cart_ElevatedButton({super.key, required this.selectedItems, required this.calculateTotalPrice});
  
  final List<Carts> selectedItems;
  final double Function() calculateTotalPrice;

  @override
  Widget build(BuildContext context) {
    void showNotiDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Thông báo"),
          content: const Text("Vui lòng chọn sản phẩm cần mua."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
    Color myColor = const Color(0xFF8E1C68);
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
        minimumSize: MaterialStateProperty.all(const Size(120, 50)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: () async {
       if(selectedItems.isNotEmpty)
       {
         Payments.addNewpayment(selectedItems);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Buy_Screen(totalPrice: calculateTotalPrice()), 
          ),
        );
       }
       else{
          showNotiDialog(context);
       }
      },
      child: Text(
        'Mua Hàng',
        style: TextStyle(color: myColor, fontSize: 18),
      ),
    );
  }
}