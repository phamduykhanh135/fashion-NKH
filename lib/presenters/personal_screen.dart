import 'package:flutter/material.dart';

import 'bottom.dart';

class Personal_Screen extends StatefulWidget {
  const Personal_Screen({Key? key}) : super(key: key);

  @override
  _Personal_ScreenState createState() => _Personal_ScreenState();
}

class _Personal_ScreenState extends State<Personal_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 7, 189, 235),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.settings,color: Colors.white,)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.shopping_cart,color: Colors.white,)),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.message,color: Colors.white,))
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5, left: 5),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.asset(
                                  'images/xuandan.png',
                                  width: 60,
                                  height: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                  ),
                                  const Text(
                                    "Xuan Dan",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 120,
                              height: 20,
                              padding: const EdgeInsets.fromLTRB(5, 3, 5, 2),
                               margin: const EdgeInsets.only(bottom: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Text('Thành viên Vàng',
                                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Padding(
                                          padding: EdgeInsets.only(left: 10 )),
                                      Icon(Icons.arrow_forward_ios_sharp,
                                          size: 12),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 200,
                                    ),
                                    const Text('Người theo dõi 30',
                                        style: TextStyle(color: Colors.white)),
                                  ],
                                ),),
                                // Expanded(child:  Column(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Container(
                                //       width: 250,
                                //     ),
                                //     const Text('Đang theo dõi 10',
                                //         style: TextStyle(color: Colors.white)),
                                //   ],
                                // )),
                               
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 50,
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.account_balance_wallet_rounded),
                      Text('Chờ xác nhận'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.crop_sharp),
                      Text('Chờ lấy hàng'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.airport_shuttle),
                      Text('Chờ giao hàng'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: const [
                      Icon(Icons.stars_rounded),
                      Text('Đánh giá'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Bottom_Nav(id: 1),
    );
  }
}
