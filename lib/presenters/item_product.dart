import 'package:flutter/material.dart';
import 'package:sales_application/presenters/product_screen.dart';

class Item_Product extends StatelessWidget {
  const Item_Product({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                // builder:(context)=>ProductScreen(productId: widget.pro.id - 1,)
                builder: (context) => const Product_Screen()));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
        width: MediaQuery.of(context).size.width * 0.5,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 220,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756',
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                //   child: Text(
                //     "Áo Thun Cổ Tròn Tay Ngắn Cá Sấu 4 Chiều Thấm Hút Biểu Tượng Dáng Vừa Đơn Giản No Style 100",
                //     style: TextStyle(
                //       fontSize: 12,
                //       color: Colors.blue,
                //       fontWeight: FontWeight.bold,
                //     ),
                //     overflow: TextOverflow.ellipsis, // hoặc TextOverflow.fade
                //     maxLines: 2, // Số dòng tối đa
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                //   child: Text(
                //     "177,000 đ",
                //     style: TextStyle(
                //         fontSize: 10,
                //         color: Colors.black,
                //         fontWeight: FontWeight.bold),
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                //   child: Text(
                //     '141,600',
                //     style: TextStyle( fontSize: 10,decoration: TextDecoration.lineThrough),
                //   ),
                // ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.local_offer,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'SALE',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
