import 'package:flutter/material.dart';
import '../../data/kien/cart_Reader.dart';
import '../../data/kien/payment_Reader.dart';
import '../../views/kien/buy_Sceen.dart';

class Cart_ElevatedButton extends StatelessWidget {
  const Cart_ElevatedButton({super.key, required this.selectedItems, required this.calculateTotalPrice});
  
  final List<Carts> selectedItems;
  final double Function() calculateTotalPrice;

  @override
  Widget build(BuildContext context) {
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
        Payments.addNewpayment(selectedItems);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Buy_Screen(totalPrice: calculateTotalPrice()), 
          ),
        );
      },
      child: Text(
        'Mua Hàng',
        style: TextStyle(color: myColor, fontSize: 18),
      ),
    );
  }
}