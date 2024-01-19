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
    bool hasDiscount = products.discount != "0";
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
                    SizedBox(
                      height: 210,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (products.image.isNotEmpty)
                            Image.network(
                              products.image,
                              fit: BoxFit.cover,
                            ),
                        ],
                      ),
                    ),
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
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Mã số :${products.id}',
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      )),
                                  if (hasDiscount)
                                    Text(
                                      '\$${products.price}',
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '\$${(double.tryParse(products.price) ?? 0.0) - (double.tryParse(products.price) ?? 0.0) * ((double.tryParse(products.discount) ?? 0.0) / 100)}',
                                    style: const TextStyle(
                                        color: Colors.green, fontSize: 20
                                        //decoration: TextDecoration.lineThrough,
                                        ),
                                  ),
                                ],
                              )),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 35,
                              margin: const EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                                    "Hướng dẫn chọn sizes",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
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
                  children: [
                    const Text(
                        //  'Price: \$${Product.products[widget.productId].price} vnd',
                        "Mô tả sản phẩm\n",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                    Text(products.descriptions),
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
