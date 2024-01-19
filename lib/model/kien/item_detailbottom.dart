import 'package:flutter/material.dart';
import '../../data/kien/product_Reader.dart';

class Detail_Bottombar extends StatelessWidget {
  final Function() showBottomSheet;
  final Products product;

  const Detail_Bottombar({super.key, required this.showBottomSheet, required this.product});

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF8E1C68);
    return Container(
      height:MediaQuery.of(context).size.height/14,
      decoration:  const BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            product.price,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          TextButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade100),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      const Size(140, 40), 
    ),
  ),
  onPressed: showBottomSheet,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Thêm vào giỏ",
        style: TextStyle(
          color: myColor,
        ),
      ),
      Icon(
        Icons.shopping_bag_outlined,
        color: myColor,
      ),
    ],
  ),
),

        ],
      ),
    );
  }
}