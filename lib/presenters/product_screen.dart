import 'package:flutter/material.dart';

import '../model/product.dart';

class Product_Screen extends StatefulWidget {
  final String idz;
  const Product_Screen({super.key, required this.idz});

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
  late Product products = Product();
  @override
  void initState() {
    super.initState();
    getData();
    print("ppppppppppppppppppppppppp${widget.idz}");
  }

  Future<void> getData() async {
    Product? userData = await FirebaseModel().getProductData(widget.idz);
    if (userData != null) {
      setState(() {
        products = userData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(widget.productId);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Product Detail'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      // products.image,
                      'https://cmsv2.yame.vn/uploads/8ae9ab2a-c50b-4854-87cb-0ff81b8afbbc/Banner_web_03_(1280x1280).jpg?quality=80&w=0&h=0',
                      fit: BoxFit.contain,
                      width: MediaQuery.of(context).size.width / 2 - 10,
                      //color: Colors.amber,
                      // height: 100,
                    )
                  ],
                ),
              ),
              const Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey,
              ),
              Container(
                margin: const EdgeInsets.all(5), //ngoài
                padding: const EdgeInsets.all(10), //trong
                decoration: const BoxDecoration(
                    // color: Colors.amber
                    ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products.name,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('Mã số: #0022708',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      )),
                                  Text(
                                      //  'Price: \$${Product.products[widget.productId].price} vnd',
                                      'Giá gốc: 177,000 đ',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.grey,
                                          decoration:
                                              TextDecoration.lineThrough)),
                                  Text(
                                      //  'Price: \$${Product.products[widget.productId].price} vnd',
                                      'Giá Sale: 144,000 đ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      )),
                                ],
                              )),
                          Expanded(
                            flex: 1,
                            child: Container(
                              width: 150,
                              height: 35,
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90)),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateColor.resolveWith(
                                              (states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return Colors.black26;
                                        }
                                        return Colors.grey;
                                      }),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10.0)))),
                                  child: const Text(
                                    "Hướng dẫn chọn size",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  )),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                height: 2,
                thickness: 2,
                color: Colors.grey,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                        //  'Price: \$${Product.products[widget.productId].price} vnd',
                        "Mô tả sản phẩm\n",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text("Chất liệu: Poly 4C\n"
                        "Thành phần: 95% Polyester 5% Spandex\n"
                        "- Mau khô\n"
                        "- Không nhăn\n"
                        "+ Kỹ thuật: In Cao\n"
                        "+ Áo thun cổ tròn may dạng raglang phối màu, sử dụng bo cotton cùng màu vải chính làm cổ áo.\n"
                        "+ Trước ngực áo họa tiết in cao\n"
                        "^ Ẩn bớt nội dung"),
                  ],
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(children: [
            Expanded(
                flex: 1,
                child: TextButton(
                  // style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
                  child: const Icon(Icons.message),
                  onPressed: () {},
                )),
            Expanded(
                flex: 1,
                child: TextButton(
                  child: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    //AddCart(pro: Product.Product.products[widget.productId].id),
                    //  _onPressCart( Product.products[widget.productId].id);
                    // print(Product.products[widget.productId].id);
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => const CartScreen()),
                    // );
                  },
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                  child: TextButton(
                    //style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
                    child: const Text("Mua ngay",
                        style: TextStyle(
                          color: Colors.white,
                        )),
                    onPressed: () {},
                  ),
                ))
          ]),
        ));
  }
}
