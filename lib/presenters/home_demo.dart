import 'package:flutter/material.dart';
import 'package:sales_application/presenters/item_demo.dart';
// Import your Item_Product widget

import '../model/product.dart';

class Home_Demo extends StatefulWidget {
  const Home_Demo({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Home_Demo> {
  late Future<List<Product>> products;

  @override
  void initState() {
    super.initState();
    products = FirebaseModel().getProductsData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: FutureBuilder<List<Product>>(
        future: products,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text('No products available.');
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Item_Demo(product: snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }
}
