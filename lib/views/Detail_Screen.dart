import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/item_detailcontainer.dart';
import 'package:sales_application/views/cart_Screen.dart';
import '../model/Item_BottomSheet.dart';
import 'package:sales_application/model/item_detailbody.dart';
import '../data/product_Reader.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> with TickerProviderStateMixin {
  List<Products>? _products;
  Color myColor = const Color(0xFF8E1C68);

  void _loadData() async {
    await Products.loadData_product();
    setState(() {
      _products = Products.products;
    });
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: const Color.fromARGB(255, 247, 240, 240),
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      builder: (context) {
        return Item_bottomSheet(product:_products![0],);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: myColor),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>   CartScreen()),
              );
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('products').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (_products == null || _products!.isEmpty) {
            return const Center(
              child: Text('Waiting for data to load...', style: TextStyle(fontSize: 20)),
              
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            _products = snapshot.data!.docs
                .map((doc) => Products.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
          }

          if (_products == null) {
            return Text('Data is null');
          }

          return Detail_body(
            showBottomSheet: () => _showBottomSheet(context),
            product: _products![0], 
          );
        },
      ),
    );
  }
}
