import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/data/cart_Reader.dart';
import 'package:sales_application/views/buy.dart';
import '../model/item_cart.dart';
import '../model/cart_bottomAppbar.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Carts>? _cart;
  Color myColor = const Color(0xFF8E1C68);

  void _loadData() async {
    await Carts.loadData_cart();
    setState(() {
      _cart = Carts.cart;
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
      itemCheckboxStates = List.filled(itemCheckboxStates.length, isCheckAll);
    });
  }

  double calculateTotalPrice() {
    double totalPrice = 0.0;
    if (_cart != null) {
      for (int i = 0; i < _cart!.length; i++) {
        if (itemCheckboxStates[i]) {
          totalPrice += _cart![i].price * _cart![i].quality;
        }
      }
    }
    return totalPrice;
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
            return CircularProgressIndicator();
          }

          if (_cart == null || _cart!.isEmpty) {
            return const Center(
              child: Text('Waiting for data to load...', style: TextStyle(fontSize: 20)),
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            _cart = snapshot.data!.docs
                .map((doc) => Carts.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
          }

          if (_cart == null) {
            return Text('Data is null');
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
                          });
                        },
                        carts: _cart![index],
                        onQuantityChanged: () {
                          // Do something when quantity changes
                        },
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
      ),
    );
  }
}
