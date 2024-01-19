import 'package:flutter/material.dart';


import '../../data/kien/product_Reader.dart';

class Detail_Bottombar extends StatelessWidget {
  final Function() showBottomSheet;
  final Products product;

  const Detail_Bottombar({Key? key, required this.showBottomSheet, required this.product});

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF8E1C68);
    return Container(
      width: MediaQuery.of(context).size.width/2,
      height:MediaQuery.of(context).size.height/10,
      decoration:  BoxDecoration(
        color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          product.discount=="0"?Text(
            product.price,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ):Column(
            children: [
              Text(
            product.price,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
              decoration: TextDecoration.lineThrough,
            ),
              ),
              Text(
            product.price=((double.parse(product.price)-((double.parse(product.price)*double.parse(product.discount))/100.0))).toStringAsFixed(3),
             style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            
              ),
            ],
          )
          ,TextButton(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade100),
    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    fixedSize: MaterialStateProperty.all<Size>(
      Size(140, 40), 
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

