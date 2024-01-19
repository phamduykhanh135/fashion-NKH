import 'package:flutter/material.dart';

class Item_Product_Admin extends StatelessWidget {
  const Item_Product_Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.grey),
        margin: const EdgeInsets.all(5),
        child: GestureDetector(
          onTap: () {
            // Uncomment and complete the navigation code as needed
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) => const Product_Screen(),
            //   ),
            // );
          },
          child: SizedBox(
            width: MediaQuery.of(context).size.width*0.95,
            height: 100,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            'https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756',
                            width:  MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                              ),
                              width: 50,
                              height: 25,
                              child: const Row(
                                
                                children: [
                                  Icon(
                                    Icons.local_offer,
                                    color: Colors.white,
                                    size: 10,
                                  ),
                                  SizedBox(width:2),
                                  Text(
                                    'SALE',
                                    style: TextStyle(
                                      fontSize: 10,
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
                    ],
                  ),
                ),
                const Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "Áo Thun Cổ Tròn Tay Ngắn Cá Sấu 4 Chiều Thấm Hút Biểu Tượng Dáng Vừa Đơn Giản No Style 100",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          '177,600',
                          style: TextStyle(
                            fontSize: 15,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(3.0),
                        child: Text(
                          "141,000 đ",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}