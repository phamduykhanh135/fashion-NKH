import 'package:flutter/material.dart';
import 'package:sales_application/kien/Container_Detail.dart';
import 'package:sales_application/kien/cart.dart';

class Detail_Screen extends StatefulWidget {
  const Detail_Screen({super.key});

  @override
  State<Detail_Screen> createState() => _Detail_ScreenState();
}

class _Detail_ScreenState extends State<Detail_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // Cho phép nội dung body hiển thị phía sau AppBar
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined))
        ],
        backgroundColor: Colors.transparent, // Đặt màu nền của AppBar là trong suốt
        elevation: 0, // Đặt độ nổi của AppBar là 0 để không có bóng đổ
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(height: 16),
                      Item_Container(),
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pink),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: const [
                      Text(
                        "Thêm vào giỏ",
                        style: TextStyle(
                          color: Color.fromARGB(255, 85, 57, 185),
                        ),
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Color.fromARGB(255, 85, 57, 185),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            )
          ),
        ],
      ),
    );
  }
}
