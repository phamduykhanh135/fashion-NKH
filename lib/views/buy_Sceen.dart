import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sales_application/model/kien/item_buy.dart';
import 'package:sales_application/model/kien/item_buybottom.dart';
import 'package:sales_application/model/kien/item_buylist.dart';
import 'package:sales_application/model/kien/item_buyselectedoption.dart';
import '../../data/kien/address_Reader.dart';
import '../../data/kien/payment_Reader.dart';

class Buy_Screen extends StatefulWidget {
  final double totalPrice;
  double? selectedVoucherValue;

  Buy_Screen({Key? key, required this.totalPrice, this.selectedVoucherValue});

  @override
  State<Buy_Screen> createState() => _Buy_ScreenState();
}

class _Buy_ScreenState extends State<Buy_Screen> {
  double? _selectedVoucherValue;
  List<Payments>? _payment;
  double _finalTotalAmount = 0.0;
  Color myColor = const Color(0xFF8E1C68);
  Address? selectedAddress;

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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mua hàng", style: TextStyle(color: myColor)),
          iconTheme: IconThemeData(color: myColor),
          backgroundColor: Colors.pink.shade100,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('payments').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print('Lỗi: ${snapshot.error}');
                return Text('Lỗi: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasData && snapshot.data != null) {
                _payment = snapshot.data!.docs.map((doc) => Payments.fromJson(doc.data() as Map<String, dynamic>)).toList();
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 1),
                child: Column(
                  children: [
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
                        return item_buy(payment: _payment![index]);
                      },
                    ),
                    const Divider(color: Colors.grey, thickness: 1),
                    
                    Buy_SelectedOption(
                      totalPrice: widget.totalPrice,
                      onVoucherSelected: (value) {
                        setState(() {
                          _selectedVoucherValue = value;
                        });
                      },
                      onAddressSelected: (address) {
                        setState(() {
                          selectedAddress = address; 
                        });
                      },
                    ),
                    
                    // Display address information
                    Container(
                      width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(8.0),
                          child: selectedAddress != null
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      selectedAddress!.fullname,
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      selectedAddress!.phone,
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                    Text(
                                      selectedAddress!.addressText,
                                      style: const TextStyle(fontSize: 18),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                )
                              : const Text('Chưa chọn địa chỉ', style: TextStyle(fontSize: 18),textAlign: TextAlign.center),
                        ),


                    const Divider(color: Colors.grey, thickness: 1),
                    Buy_List(
                      totalPrice: widget.totalPrice,
                      selectedVoucherValue: _selectedVoucherValue ?? 0.0,
                      onTotalAmountChanged: (finalTotalAmount) {
                        _finalTotalAmount = finalTotalAmount;           
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: BuyBottom(
          onTotalAmountChanged: widget.totalPrice,
          VoucherSale: _selectedVoucherValue ?? 0,
          address: selectedAddress,
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    await Payments.deleteAllPayments();
    return true;
  }
}