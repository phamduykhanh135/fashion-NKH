import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../views/buy.dart';
import 'cart_ElevatedButton.dart';

class Cart_bottom extends StatefulWidget {
  final bool isCheckAll;
  final VoidCallback onToggleCheckAll;

  const Cart_bottom({
    Key? key,
    required this.isCheckAll,
    required this.onToggleCheckAll,
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
                Text("100.000VND", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                      onChanged: (bool? value) {
                        widget.onToggleCheckAll();
                      },
                    ),
                    const Text("tất cả", style: TextStyle(fontSize: 18)),
                  ],
                ),
                const Cart_ElevatedButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}