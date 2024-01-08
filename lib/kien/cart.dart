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
  Color myColor = Color(0xFF8E1C68);

  bool ischeck = false;
  List<bool> itemCheckboxStates = List.generate(100, (index) => false);


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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 1), // Adjust this value
        child: Stack(
          children: [
            ListView(
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
                          ischeck = itemCheckboxStates.every((state) => state);
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100, // Adjust this height according to your bottom app bar's content
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Tổng tiền",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  Text("100.000VND",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  
                ],  
              ),
              SizedBox(height: 10,),
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    checkColor: Colors.black,
                    fillColor: MaterialStateProperty.all(Colors.pink.shade100),
                    side: BorderSide(color: Colors.black),
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
                  const Text("tất cả", style: TextStyle(fontSize: 18)),
                ],
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pink.shade100),
                  minimumSize: MaterialStateProperty.all(const Size(120, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Buy_Screen()),
                  );
                },
                child: Text(
                  'Thanh toán',
                  style: TextStyle(color: myColor,fontSize: 18),
                ),
              ),
            ],
          ),
            ],
          )
        ),
      ),
    );
  }
}
