
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'bottom.dart';
import 'drawer.dart';
import 'item_product.dart';


class Menu_Screen extends StatefulWidget {
  const Menu_Screen({super.key});

  @override
  State<Menu_Screen> createState() => _Menu_ScreenState();
}

class _Menu_ScreenState extends State<Menu_Screen> {
  int _currentIndex = 0;
  int count = (5 / 2).ceil();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("SALE APPLICATION"),
          centerTitle: true,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
          ],
        ),
        drawer: const Drawer_Menu(),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search_sharp),
                      hintText: "Tìm kiếm sản phẩm",
                      border: OutlineInputBorder()),
                  onChanged: (value) {},
                ),
              ),
              Container(
                child: Column(
                  children: [
                    CarouselSlider(
                      items: [
                        Image.network(
                            'https://cdn2.yame.vn/pimg/ao-thun-sweater-ngan-ha-space-ver37-0021380/73b8a215-24a3-ec00-0317-001a12c0acec.jpg?w=540&h=756'),
                        Image.network(
                            'https://cdn2.yame.vn/pimg/ao-thun-co-tron-on-gian-ngan-ha-space-ver16-0020556/dfeb53a3-c7ed-e800-53f4-0018ac665d5b.jpg?w=540&h=756'),
                        Image.network(
                            'https://cdn2.yame.vn/pimg/so-mi-co-danton-than-co-ai-khepri-ver2-0021563/7a839b12-e38c-9c00-e4a8-001a235d78d5.jpg?w=540&h=756'),
                        Image.network(
                            'https://cdn2.yame.vn/pimg/ao-khoac-la-co-y-nguyen-ban-18--ver39-0021147/29d2f437-dac2-c800-73bf-001999bb2024.jpg?w=540&h=756'),
                        Image.network(
                            'https://cdn2.yame.vn/pimg/so-mi-tay-ngan-on-gian-y-nguyen-ban-ver50-0021396/39834ab1-150b-3a01-adf4-001a33ea75f4.jpg?w=800'),
                        // Add more images if needed
                      ],
                      options: CarouselOptions(
                        height: 150.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5, // Replace with the actual number of images
                        (index) => buildDotIndicator(index),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(color: Colors.grey),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: count,
                        itemBuilder: (_, index) {
                          if (index == count - 1) {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Expanded(
                                    child: Item_Product(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: SizedBox(),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Expanded(
                                    child: Item_Product(),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Item_Product(),
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
        bottomNavigationBar: const Bottom_Nav(id: 0),
        );
  }

  Widget buildDotIndicator(int index) {
    return Container(
      margin: const EdgeInsets.all(4),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentIndex == index ? Colors.blue : Colors.grey,
      ),
      
    );
    
  }
}
