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
            // color: const Color.fromARGB(255, 7, 189, 235),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.settings,
                            // color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            // color: Colors.white,
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 5, left: 5),
                        child: CircleAvatar(
                          radius: 50, // You can adjust the radius as needed
                          backgroundColor: Colors
                              .transparent, // You can set a background color if needed
                          backgroundImage: AssetImage('images/xuandan.png'),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 30),
                                  ),
                                  Column(
                                    children: const [
                                      Text('name: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "Xuan Dan",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Text('std: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text('0306211470 ',
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Text('email: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text('duyhanh18092003@gmail.com ',
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    children: const [
                                      Text('address: ',
                                          style: TextStyle(
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                          '142. D Dương Bá Trạc, P2, Q8, HCM. ',
                                          style: TextStyle(
                                            fontSize: 18,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {
                // Add your onPressed function here
              },
              child: SizedBox(
               //color: Colors.grey,
                height: 60,
                width: MediaQuery.of(context).size.width-20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                     Text('Lịch sử dơn hàng',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                     Icon(Icons.arrow_forward,size: 20,)
                  ],
                ),
              )
            ),
          )
        ],
      ),
      bottomNavigationBar: const Bottom_Nav(id: 1),
    );
  }
}
