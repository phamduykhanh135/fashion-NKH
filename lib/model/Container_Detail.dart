import 'package:flutter/material.dart';
import 'package:sales_application/data/product_Reader.dart';

class Item_Container extends StatefulWidget {
  final Products product;

  const Item_Container({Key? key, required this.product}) : super(key: key);

  @override
  State<Item_Container> createState() => _Item_ContainerState();
}

class _Item_ContainerState extends State<Item_Container> {
  String selectedSize = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text("\t\t Kích thước: "),
                      SizedBox(width: MediaQuery.of(context).size.width / 1.6),
                      IconButton(
                        onPressed: () {
                          _showHelpDialog(context);
                        },
                        icon: Icon(Icons.help_outline),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 15),
                      buildSizeButton("S"),
                      SizedBox(width: MediaQuery.of(context).size.width / 15),
                      buildSizeButton("M"),
                      SizedBox(width: MediaQuery.of(context).size.width / 15),
                      buildSizeButton("L"),
                      SizedBox(width: MediaQuery.of(context).size.width / 15),
                      buildSizeButton("XL"),
                    ],
                  ),
                  if (selectedSize.isNotEmpty) buildQuantityRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSizeButton(String size) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        overlayColor: MaterialStateColor.resolveWith(
            (states) => size == selectedSize ? Colors.grey : Colors.transparent),
        side: MaterialStateBorderSide.resolveWith(
            (states) => BorderSide(color: Colors.black)),
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => size == selectedSize ? Colors.pink.shade100 : Colors.white),
      ),
      onPressed: () {
        // Cập nhật kích thước đã chọn khi nhấn vào nút kích thước
        setState(() {
          selectedSize = size;
        });
      },
      child: Text(size,
          style: TextStyle(
              color: size == selectedSize ? Colors.white : Colors.black)),
    );
  }

  Widget buildQuantityRow() {
    int quantity = 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Số lượng: $quantity", style: TextStyle(fontSize: 16)),
      ],
    );
  }

  void _showHelpDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Image.network(
            "https://cmsv2.yame.vn/uploads/96de2b6a-7cba-42ec-82ab-a80a62693726/size-chart-01.jpg",
            fit: BoxFit.contain,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Đóng"),
            ),
          ],
        );
      },
    );
  }
}
  