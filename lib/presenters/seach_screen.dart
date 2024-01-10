import 'package:flutter/material.dart';
import 'package:sales_application/presenters/item_product.dart';

import 'group_category copy.dart';

class Search_Screen extends StatefulWidget {
  const Search_Screen({super.key});

  @override
  State<Search_Screen> createState() => _Search_ScreenState();
}

class _Search_ScreenState extends State<Search_Screen> {
  // List<Product> lst = [];
  String txtKey = "Tất cả";
  // Future<void> loadData() async {
  //   Product.loadData().then((value) {
  //     setState(() {
  //       if (txtKey == "Tất cả") {
  //         lst = Product.products;
  //       } else {
  //         lst = Product.products
  //             .where((element) => element.cat.name.contains(txtKey))
  //             .toList();
  //       }
  //     });
  //   });
  // }
  int count = 0;
  void tang() {
    setState(() {
      count++;
    });
  }

  void onChangeD(value) {
    setState(() {
      txtKey = value;
      // loadData();
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
                          width: MediaQuery.of(context).size.width*0.9,
                          height: 40,
                          margin: const EdgeInsets.fromLTRB(10, 70, 0, 10),
                          padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                          child: TextField(
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
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                if (index == 5 - 1) {
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
              childCount: 5,
            ),
          ),
        ],
      ),
    );
  }
}
