import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../data/product_Reader.dart';
class Detail_Bottombar extends StatelessWidget {
  final Function() showBottomSheet;
  final Products product;

  const Detail_Bottombar({Key? key, required this.showBottomSheet, required this.product});

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF8E1C68);
    return Container(
      decoration:  BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "${product.price}.000",
            style: TextStyle(
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
            ),
            onPressed: showBottomSheet,
            child: Row(
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

