import 'package:flutter/material.dart';

import '../model/product.dart';
import '../views/kien/detail_Screen.dart';

class Item_Product_Home extends StatelessWidget {
  final Product product;

  const Item_Product_Home({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     bool hasDiscount = product.discount != "0";
    return GestureDetector(
      onTap: () {
       
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DetailScreen(idz: product.id)
           // Product_Screen(idz: product.id),
            
          ),
        );
        print("ssssssssssssssssssssssss${product.id}");
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: MediaQuery.of(context).size.width * 0.5,
        height: 220,
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                 // padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  height: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Use the product.image property here
                      Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
           if (hasDiscount)
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.local_offer,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Column(
                        children: [
                          const Text(
                            'SALE',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                          Text(
                            '${product.discount}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}