  import 'package:flutter/material.dart';
  import 'package:sales_application/model/item_detailcontainer.dart';
  import 'package:sales_application/model/item_detailbottom.dart';
  import '../data/product_Reader.dart';
  import '../data/product_Reader.dart';

  class Detail_body extends StatelessWidget {
  final Function() showBottomSheet;
  final Products product;

  const Detail_body({Key? key, required this.showBottomSheet, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF8E1C68);
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
                    SizedBox(height: 16),
                    Text(
                      product.name,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    Item_Container(product: product, onSizeSelected:(String){},),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30,),
                          Text(
                            "\t\t Mô tả sản phẩm",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Divider(height: 10),
                          Text(
                            product.description,
                            style: TextStyle(fontSize: 18),
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
          bottom: 1,
          left: 1,
          right: 1,
          child: Detail_Bottombar(showBottomSheet: showBottomSheet, product: product),
        ),
      ],
    );
  }
}