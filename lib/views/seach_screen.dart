import 'package:flutter/material.dart';
import '../presenters/item_demo.dart';
import '../presenters/group_category copy.dart';
import '../model/product.dart'; // Import model Product

class Search_Screen extends StatefulWidget {
  const Search_Screen({
    super.key,
  });

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = FirebaseModel().getProductsData();
  }

  String txtKey = "Tất cả";
  int count = 0;

  void onChangeD(String category) {
    setState(() {
      txtKey = category;
      // Gọi hàm tìm kiếm theo danh mục từ FirebaseModel
      products = FirebaseModel().searchProductsByCategory("", category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.pink.shade100,
            expandedHeight: 180.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: 50,
                          margin: const EdgeInsets.fromLTRB(10, 70, 0, 10),
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),//
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                products =
                                    FirebaseModel().searchProducts(value);
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'Tìm kiếm...',
                              hintStyle: const TextStyle(color: Colors.grey),
                              filled: true,
                              fillColor: Colors.grey.shade200,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            style: const TextStyle(color: Colors.grey),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                      ],
                    ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GroupCategory(onChangeD: onChangeD),
                          Row(
                            children: [
                              const Text("Giá:",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_arrow_up)),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.keyboard_arrow_down))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              // Use FutureBuilder to asynchronously load data
              return  FutureBuilder<List<Product>>(
                    future: products,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("hào ngu");
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
                                    const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Item_Demo(
                                          product: snapshot
                                              .data![firstProductIndex]),
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: secondProductIndex <
                                              snapshot.data!.length
                                          ? Item_Demo(
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
                  );
            }, childCount: 1),
          ),
        ],
      ),
    );
  }
}
