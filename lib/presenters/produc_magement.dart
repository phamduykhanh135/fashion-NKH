import 'package:flutter/material.dart';

import 'group_category.dart';
import 'item_product_admin.dart';

class Product_Management extends StatefulWidget {
  const Product_Management({super.key});

  @override
  State<Product_Management> createState() => _Product_ManagementState();
}

class _Product_ManagementState extends State<Product_Management> {
  //   List<Product> lst = [];
  // String txtKey = "Tất cả";
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
      // txtKey = value;
      // loadData();
    });
  }
  final int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quản lý sản phẩm'),
          // actions: [
          // // ElevatedButton(onPressed: (){}, child: const Text('Thêm sản phẩm'))
          // ],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: 'Tìm kiếm sản phẩm',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GroupCategory(onChangeD: onChangeD),
                    Container(
                      child: ElevatedButton(onPressed: (){}, 
                      child: const Text('Thêm sản phẩm')),
                    )
                  ],
                ),
              ),
              Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (_, index) {
                        return Container(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Item_Product_Admin(),
                              ],
                            ));
                      }))
            ]),
          ),
        ));
  }
}
