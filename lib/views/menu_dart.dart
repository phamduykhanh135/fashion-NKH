import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/bottom.dart';
import 'package:sales_application/views/kien/cart_Screen.dart';

import '../models/product.dart';

import 'item_poduct_home.dart';

import 'seach_screen.dart';

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
                        child: const Row(
                          children: [
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
                                fontSize: 13,
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
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      Image.asset('assets/name2.png'),
                      Image.asset('assets/name3.png'),
                      Image.asset('assets/name1.png'),
                      Image.asset('assets/name4.png'),
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
