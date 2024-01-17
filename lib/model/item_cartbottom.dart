import 'package:flutter/material.dart';
import '../data/cart_Reader.dart';
import '../views/buy_Sceen.dart';
import 'item_cartbutton.dart';

class Cart_bottom extends StatefulWidget {
  final bool isCheckAll;
  final VoidCallback onToggleCheckAll;
  final double totalPrice; 
  final List<Carts> selectedItems;

  final double Function() calculateTotalPrice;  // Add this line

  const Cart_bottom({
    Key? key,
    required this.isCheckAll,
    required this.onToggleCheckAll,
    required this.totalPrice,
    required this.selectedItems,

    required this.calculateTotalPrice,  // Add this line
  }) : super(key: key);

  @override
  State<Cart_bottom> createState() => _Cart_bottomState();
}

class _Cart_bottomState extends State<Cart_bottom> {
  Color myColor = Color(0xFF8E1C68);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tổng tiền", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("${widget.totalPrice.toStringAsFixed(3)}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      fillColor: MaterialStateProperty.all(Colors.pink.shade100),
                      side: BorderSide(color: Colors.black),
                      value: widget.isCheckAll,
                      onChanged: (bool? value) async {
                        widget.onToggleCheckAll();
                      },
                    ),
                    const Text("tất cả", style: TextStyle(fontSize: 18)),
                  ],
                ),
                Cart_ElevatedButton(selectedItems: widget.selectedItems, calculateTotalPrice: widget.calculateTotalPrice),  // Pass calculateTotalPrice
              ],
            ),
          ],
        ),
      ),
    );
  }
}
