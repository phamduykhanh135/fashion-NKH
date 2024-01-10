import 'package:flutter/material.dart';
import '../model/Container_Detail.dart';
import 'package:sales_application/views/cart.dart';
import '../model/Item_BottomSheet.dart';
import 'package:sales_application/model/Detail_body.dart';
class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Color myColor = Color(0xFF8E1C68);
  // Function to show the bottom sheet
  void _showBottomSheet() {
    showModalBottomSheet(
      backgroundColor: Color.fromARGB(255, 247, 240, 240),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Item_bottomSheet();
      },
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      iconTheme: IconThemeData(color: myColor),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            );
          },
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
      ],
      backgroundColor: Color.fromARGB(0, 0, 0, 0),
      elevation: 0,
    ),
    body: Detail_body(showBottomSheet: _showBottomSheet),
  );
}

}
