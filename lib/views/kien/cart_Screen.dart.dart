// cart_Screen

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/data/kien/cart_Reader.dart';
import '../../model/kien/item_cart.dart';
import '../../model/kien/item_cartbottom.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Carts>? _cart;
  List<Carts> selectedItems = [];
  Color myColor = const Color(0xFF8E1C68);

  void _loadData() async {
    await Carts.loadData_cart();
    setState(() {
      _cart = Carts.cart;
      selectedItems = _cart!.where((cart) => itemCheckboxStates[cart.id.length - 1]).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  bool isCheckAll = false;
  List<bool> itemCheckboxStates = List.generate(100, (index) => false);

  void toggleCheckAll() {
    setState(() {
      isCheckAll = !isCheckAll;

      if (isCheckAll) {
        selectedItems = List.from(_cart!);
      } else {
        selectedItems.clear();
      }

      for (int i = 0; i < itemCheckboxStates.length; i++) {
        itemCheckboxStates[i] = isCheckAll;
      }

      onTotalPriceChanged(calculateTotalPrice());
    });
  }

 void clearAndReloadSelectedItems() {
  setState(() {
    selectedItems.clear();


    for (int i = 0; i < _cart!.length; i++) {
  
      if (itemCheckboxStates[i]) {
        selectedItems.add(_cart![i]);
      }
    }
  });
}


  double calculateTotalPrice() {
    double totalPrice = 0.0;
    if (_cart != null) {
      for (int i = 0; i < _cart!.length; i++) {
        if (itemCheckboxStates[i]) {
          totalPrice += double.parse(_cart![i].price) * double.parse(_cart![i].quality);
        }
      }
    }
    return totalPrice;
  }

  void onTotalPriceChanged(double totalPrice) {
    print('Total Price Changed: $totalPrice');
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('carts').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (_cart == null || _cart!.isEmpty) {
            return const Center(
              child: Text('Waiting for data to load...', style: TextStyle(fontSize: 20)),
            );
          }
if (snapshot.hasData && snapshot.data != null) {
        
          }

          if (_cart == null) {
            return const Text('Data is null');
          }

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _cart!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Item_cart(
                        ischeck: itemCheckboxStates[index],
                        onCheckboxChanged: (bool value) {
                          setState(() {
                            itemCheckboxStates[index] = value;
                            isCheckAll = itemCheckboxStates.every((state) => state);
                            if (value) {
                              selectedItems.add(_cart![index]);
                            } else {
                              selectedItems.remove(_cart![index]);
                            }
                          });
                           clearAndReloadSelectedItems();
                        },
                        carts: _cart![index],
                        onQuantityChanged: () {},
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Cart_bottom(
        isCheckAll: isCheckAll,
        onToggleCheckAll: toggleCheckAll,
        totalPrice: calculateTotalPrice(),
        selectedItems: selectedItems,
        calculateTotalPrice: calculateTotalPrice,
      ),
    );
  }
}