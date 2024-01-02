import 'package:flutter/material.dart';

class Product_Screen extends StatefulWidget {
  const Product_Screen({super.key});

  @override
  State<Product_Screen> createState() => _Product_ScreenState();
}

class _Product_ScreenState extends State<Product_Screen> {
//  void _onPressCart(int newId) {
//   bool checkId = false;
//   int checkSimilar = 0;

//   setState(() {
//     for (int i = 0; i < Cart.carts.length; ++i) {
//       if (Cart.carts[i].product.id == newId) {
//        // print('vào $newId');
//         checkId = true;
//         checkSimilar = i;
//         break;
//       }
//     }
//     if (checkId) {
//       Cart.carts[checkSimilar].qualityCart++;
//     } else {
//       Cart.carts.add(Cart(Product.products[newId-1]));
//     }
//   });
// }
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
                      //  Product.products[widget.productId].url,
                      'https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756',
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
                    const Text(
                      // Product.products[widget.productId].name,
                      "Áo Thun Cổ Tròn Tay Ngắn Cá Sấu 4 Chiều Thấm Hút Biểu Tượng Dáng Vừa Đơn Giản No Style 100",
                      style: TextStyle(
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
                    child:  const Text("Mua ngay",style: TextStyle(color: Colors.white,)),
                    onPressed: () {},
                  ),
                ))
          ]),
        ));
  }
}
