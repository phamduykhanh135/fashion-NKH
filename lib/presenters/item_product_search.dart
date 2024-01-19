import 'package:flutter/material.dart';
import 'package:sales_application/presenters/product_screen.dart';
import '../model/product.dart';

class Item_Product_Search extends StatelessWidget {
  final Product product;

  const Item_Product_Search({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool hasDiscount = product.discount != "0";
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Product_Screen(idz: product.id),
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
                  height: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        product.image,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                margin: const EdgeInsets.fromLTRB(5, 5, 5, 10),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey
                      .withOpacity(0.3), // Adjust the opacity as needed
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    topLeft: Radius.circular(8),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (hasDiscount)
                      Text(
                        '\$${product.price}',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    const SizedBox(height: 4),
                    Text(
                      '\$${(double.tryParse(product.price) ?? 0.0) - (double.tryParse(product.price) ?? 0.0) * ((double.tryParse(product.discount) ?? 0.0) / 100)}',
                      style: const TextStyle(
                        color: Colors.green,
                        //decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ),
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
                                fontSize: 10),
                          ),
                          Text(
                            '${product.discount}%',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
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
