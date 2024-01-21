  import 'package:flutter/material.dart';

  import 'package:sales_application/model/kien/item_detailbottom.dart';

import '../../data/kien/product_Reader.dart';
import 'item_detailcontainer.dart';


  class Detail_body extends StatelessWidget {
  final Function() showBottomSheet;
  final Products product;

  const Detail_body({Key? key, required this.showBottomSheet, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF8E1C68);
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height / 2.1,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                ),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Text(
                      product.name,
                      style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Item_Container(product: product, onSizeSelected:(String){}, onQuantityChanged: (int ) {  },),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30,),
                          const Text(
                            "\t\t Mô tả sản phẩm",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Divider(height: 10),
                          Text(
                            product.description,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],  
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Detail_Bottombar(showBottomSheet: showBottomSheet, product: product),
        ),
      ],
    );
  }
}