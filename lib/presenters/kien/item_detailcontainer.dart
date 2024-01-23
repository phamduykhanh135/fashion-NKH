import 'package:flutter/material.dart';
import 'package:sales_application/model/kien/product_Reader.dart';

class Item_Container extends StatefulWidget {
  final Products product;
  final Function(String) onSizeSelected;
  final void Function(int) onQuantityChanged;

  const Item_Container({Key? key, required this.product, required this.onSizeSelected, required this.onQuantityChanged}) : super(key: key);

  @override
  State<Item_Container> createState() => _Item_ContainerState();
}

class _Item_ContainerState extends State<Item_Container> {
  String selectedSize = '';
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
       
        child: Column(
          children: [
            Container(
              child: Row(
              
                children: [
                  const Text("\t\t Kích thước:",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(width: 180,),
                  IconButton(
                        onPressed: () {
                         _showHelpDialog(context);
                        },
                        icon: const Icon(Icons.help_outline),
                      ),
                    ],
                  ),
            ),
              Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      buildSizeButton("S"),
                    SizedBox(width: MediaQuery.of(context).size.width / 20),
                      buildSizeButton("M"),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      buildSizeButton("L"),
                      SizedBox(width: MediaQuery.of(context).size.width / 20),
                      buildSizeButton("XL"),
                    ],
                  ),
                  if (selectedSize.isNotEmpty) buildQuantityRow(),

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
            (states) => const BorderSide(color: Colors.black)),
        backgroundColor: MaterialStateColor.resolveWith(
            (states) => size == selectedSize ? Colors.pink.shade100 : Colors.white),
      ),
      onPressed: () {
        
       setState(() {
          selectedSize = size;
          widget.onSizeSelected(selectedSize);
          switch (size) {
            case 'S':
              quantity = int.parse(widget.product.sizeS);
              break;
            case 'M':
              quantity =int.parse(widget.product.sizeM);
              break;
            case 'L':
              quantity = int.parse(widget.product.sizeL);
              break;
            case 'XL':
              quantity = int.parse(widget.product.sizeXL);
              break;
            default:
              quantity = 0;
          }
          widget.onQuantityChanged(quantity);
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
        Text("Số lượng: $quantity", style: const TextStyle(fontSize: 16)),
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
              child: const Text("Đóng"),
            ),
          ],
        );
      },
    );
  }
}
  