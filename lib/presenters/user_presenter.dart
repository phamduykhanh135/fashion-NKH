import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> {

  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Product Count Example'),
        ),
        body: Center(
          child: FutureBuilder<int>(
            future: fetchTotalProductCount(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Text(
                  'Tổng số lượng sản phẩm: ${snapshot.data}',
                  style: const TextStyle(fontSize: 18),
                );
              }
            },
          ),
        ),
      ),
    );
  }

  Future<int> fetchTotalProductCount() async {
    QuerySnapshot productsSnapshot = await productsCollection.get();
    return productsSnapshot.size;
  }
}
