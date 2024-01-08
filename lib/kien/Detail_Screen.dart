import 'package:flutter/material.dart';
import 'package:sales_application/kien/Container_Detail.dart';
import 'package:sales_application/kien/cart.dart';
import 'Item_BottomSheet.dart';
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(color: myColor),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CartScreen()),);
          }, icon: const Icon(Icons.shopping_cart_outlined,)),
        ],
        backgroundColor: Colors.transparent,
        
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: MediaQuery.of(context).size.height / 2.1,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    "https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756",
                    fit: BoxFit.cover,
                  ),
                ),
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              SliverToBoxAdapter(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children:  [
                      SizedBox(height: 16),
                       Text("Áo PHÔNG TRẮNG", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                      ItemContainer(),
                      Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 30,),
                        Text("Mô tả sản phẩm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                        Divider(height: 10),
                         Text(
                          "Chất liệu: 100% Catton Compact 2SC2\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n"
                              "- mềm mại",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
                      
                      
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,

            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "299.000VND",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade100),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: _showBottomSheet,
                    child: Row(
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
            ),
          ),
        ],
      ),
    );
  }
}
