import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/model/buy_SelectedOption.dart';
import 'package:sales_application/model/buy_list.dart';
import 'package:sales_application/views/cart.dart';
import '../model/buy_bottom.dart';
import '../model/item_buy.dart';
import 'payment.dart';
import 'Voucher.dart';
import '../data/payment_Reader.dart';
class Buy_Screen extends StatefulWidget {
  const Buy_Screen({super.key});

  @override
  State<Buy_Screen> createState() => _Buy_ScreenState();
}

class _Buy_ScreenState extends State<Buy_Screen> {
  List<Payments>? _payment;
  Color myColor = const Color(0xFF8E1C68);
  void _loadData() async {
    await Payments.loadData_payment();
    setState(() {
      _payment = Payments.payment;
    });
  }
  @override
  void initState() {
    super.initState();
    _loadData();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
       appBar: AppBar(title: Text("Mua hàng",style: TextStyle(color: myColor)),
      iconTheme: IconThemeData(color: myColor),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
       ),
       
       body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('payments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (_payment == null || _payment!.isEmpty) {
            return const Center(
              child: Text('Waiting for data to load...', style: TextStyle(fontSize: 20)),
              
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            _payment = snapshot.data!.docs
                .map((doc) => Payments.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
          }

          if (_payment == null) {
            return Text('Data is null');
          }

          return Padding(padding: const EdgeInsets.only(bottom: 1),
       child: Stack(
        children: [
          ListView(children: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: const Text(
              'Tổng đơn hàng:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
  ListView.builder(
    padding: EdgeInsets.only(left: 20),
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: _payment!.length,
    itemBuilder: (BuildContext context, int index) {
      return  item_buy (payment: _payment![index],); 
    },
  ),
  const Divider( color: Colors.grey, thickness: 1),
  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Địa chỉ nhận hàng:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            maxLength: 150,
            decoration: const InputDecoration(
              hintText: 'Nhập địa chỉ của bạn',
              border: OutlineInputBorder(),
              
            ),
          ),
        ],
      ),
  ),
  Buy_SelectedOption(),
    const Divider( 
      color: Colors.grey, 
      thickness: 1, 
    ),
    Buy_List(),
]),
        ],
       ),);
        },
      ),
       bottomNavigationBar:const buy_bottom()
      );
    
  }
}