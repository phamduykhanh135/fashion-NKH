import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/model/Container_Detail.dart';
import 'package:sales_application/model/Detail_bottombar.dart';
class Detail_body extends StatelessWidget {
  final Function() showBottomSheet;

  const Detail_body({Key? key, required this.showBottomSheet});

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
                    "https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756",
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
                    children:  [
                      SizedBox(height: 16),
                       Text("Áo PHÔNG TRẮNG", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),),
                      ItemContainer(),
                      Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SizedBox(height: 30,),
                        Text("Mô tả sản phẩm", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
                        Divider(height: 10),
                         Text(
                          "Chất liệu: 100% Catton Compact 2SC2\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n" +
                              "- Thành phần: 100% Catton\n"
                              "- mềm mại",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
               Detail_Bottombar(
        showBottomSheet: showBottomSheet,        
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
          child: Detail_Bottombar(showBottomSheet: showBottomSheet),
        ),
      ],
    );
  }
}
