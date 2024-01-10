import 'package:flutter/material.dart';

import 'package:sales_application/model/cart_bottomAppbar.dart';

import '../model/item_cart.dart';
import '../views/buy.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Color myColor = Color(0xFF8E1C68);
  bool isCheckAll = false;
  List<bool> itemCheckboxStates = List.generate(100, (index) => false);

  void toggleCheckAll() {
    setState(() {
      isCheckAll = !isCheckAll;
      itemCheckboxStates = List.filled(itemCheckboxStates.length, isCheckAll);
    });
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        "Giỏ hàng",
        style: TextStyle(color: myColor),
      ),
      iconTheme: IconThemeData(color: myColor),
      backgroundColor: Colors.pink.shade100,
      centerTitle: true,
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 1),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Item_cart(
                  ischeck: itemCheckboxStates[index],
                  onCheckboxChanged: (bool value) {
                    setState(() {
                      itemCheckboxStates[index] = value;
                      isCheckAll = itemCheckboxStates.every((state) => state);
                    });
                  },
                );
              },
            ),
          ],
        ),
      ),
    ),
    bottomNavigationBar: Cart_bottom(
      isCheckAll: isCheckAll,
      onToggleCheckAll: toggleCheckAll,
    ),
  );
}

}
