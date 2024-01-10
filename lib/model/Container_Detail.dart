import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ItemContainer extends StatefulWidget {
  const ItemContainer({Key? key});

  @override
  State<ItemContainer> createState() => _ItemContainerState();
}

class _ItemContainerState extends State<ItemContainer> {
  String selectedSize = ''; // Track the selected size
  int quantity = 0;

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
                  // Display quantity row only when a size is selected
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
