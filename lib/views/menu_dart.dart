import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/item_poduct_home.dart';
import 'package:sales_application/views/kien/cart_Screen.dart';

import '../model/product.dart';
import 'seach_screen.dart';
import '../presenters/bottom.dart';
class Menu_Screen extends StatefulWidget {
  const Menu_Screen({super.key});

  @override
  State<Menu_Screen> createState() => _Menu_ScreenState();
}

class _Menu_ScreenState extends State<Menu_Screen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = FirebaseModel().getProductsData();
  }

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Container(
              decoration: BoxDecoration(color: Colors.pink.shade100),
              child: Row(children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Search_Screen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20)),
                        height: 40,
                        width: MediaQuery.of(context).size.width - 20,
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Icon(
                              Icons.search,
                              size: 15,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Tìm kiếm...',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                        );
                        },
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ))
              ]),
            ),
            Container(
              color: Colors.pink.withOpacity(0.1),
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      Image.network(
                          'https://cmsv2.yame.vn/uploads/8ae9ab2a-c50b-4854-87cb-0ff81b8afbbc/Banner_web_03_(1280x1280).jpg?quality=80&w=0&h=0'),
                      Image.network(
                          'https://cmsv2.yame.vn/uploads/60b16fe1-2f0f-4535-b264-9ba7784e0934/Banner_web_04_(_1280x1280).jpg?quality=80&w=0&h=0'),
                      Image.network(
                          'https://cmsv2.yame.vn/uploads/da6551a6-7ed7-4515-8502-f8b1de462d36/z4963783541296_74a59797be557c9e67f67f28fbc7ba41.jpg?quality=80&w=0&h=0'),
                      Image.network(
                          'https://cmsv2.yame.vn/uploads/c54d6d05-b510-43ef-bfed-96fcc70b0639/Landing_page_MGC_(1280x..)02.jpg?quality=80&w=0&h=0'),
                      Image.network(
                          'https://cmsv2.yame.vn/uploads/ae4227ee-2ac9-49c4-918b-689f5f9c0fae/BALO-Sale-2.jpg?quality=80&w=0&h=0'),
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
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        5, // Replace with the actual number of images
                        (index) => buildDotIndicator(index),
                      ),
                    ),
                  ),

                  FutureBuilder<List<Product>>(
                    future: products,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text("Error: ${snapshot.error}");
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text("No products available");
                      } else {
                        return Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: (snapshot.data!.length / 2).ceil(),
                            itemBuilder: (_, index) {
                              final int firstProductIndex = index * 2;
                              final int secondProductIndex =
                                  firstProductIndex + 1;

                              return Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Item_Product_Home(
                                          product: snapshot
                                              .data![firstProductIndex]),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: secondProductIndex <
                                              snapshot.data!.length
                                          ? Item_Product_Home(
                                              product: snapshot
                                                  .data![secondProductIndex])
                                          : const SizedBox(),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }
                    },
                  )
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
