import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import './item_cart.dart';
import './buy.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool ischeck = false;
    List<bool> itemCheckboxStates = List.generate(100, (index) => false);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Giỏ hàng",
          textAlign: TextAlign.center,
        ),
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Item_cart(
                    ischeck: itemCheckboxStates[index],
                    onCheckboxChanged: (bool value) {
                      setState(() {
                        itemCheckboxStates[index] = value;
                        ischeck = itemCheckboxStates.every((state) => state);
                      });
                    },
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 45,
            left: 0,
            right: 0,
            child: Container(
              height: 40,
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: const [

                  Text(
                    'Tổng tiền:',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                  Text(
                    '100000đ',
                    style: TextStyle(color: Colors.black,fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 50,
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: ischeck,
                    onChanged: (bool? value) {
                      setState(() {
                        ischeck = value ?? false;
                        itemCheckboxStates = List.filled(
                          itemCheckboxStates.length,
                          ischeck,
                        );
                      });
                    },
                  ),
                  const Text("tất cả"),
                  Spacer(),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      // Xử lý khi người dùng nhấn nút
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Buy_Screen()),
                      );
                    },
                    child: const Text('Mua hàng'),
                  ),
                ],
              ),
            ),
          ), 

        ],
      ),
    );
  }
}