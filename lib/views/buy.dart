import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/data/payment_Reader.dart';
import '../model/buy_SelectedOption.dart';
import '../model/buy_list.dart';
import '../model/buy_bottom.dart';
import '../model/item_buy.dart';
import 'Voucher.dart';

class Buy_Screen extends StatefulWidget {
  final double totalPrice;
   double? selectedVoucherValue;
   
   Buy_Screen({Key? key, required this.totalPrice,this.selectedVoucherValue});

  @override
  State<Buy_Screen> createState() => _Buy_ScreenState();
}

class _Buy_ScreenState extends State<Buy_Screen> {
  double? _selectedVoucherValue;
  List<Payments>? _payment;
  double _finalTotalAmount = 0.0;
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
  
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mua hàng", style: TextStyle(color: myColor)),
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

            return Padding(
              padding: const EdgeInsets.only(bottom: 1),
              child: Stack(
                children: [
                  ListView(
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
                     Buy_SelectedOption(
                      onVoucherSelected: (value) {
                        setState(() {
                          // Cập nhật giá trị voucher được chọn
                          _selectedVoucherValue = value;
                        });
                      },
                    ),

                      const Divider(color: Colors.grey,thickness: 1),
                      // Trong phương thức build của Buy_Screen
                      Buy_List(
                        totalPrice: widget.totalPrice,
                        selectedVoucherValue: _selectedVoucherValue ?? 0.0,
                        onTotalAmountChanged: (finalTotalAmount) {
                          _finalTotalAmount = finalTotalAmount;
                        },
                      ),

                    ],
                  ),
                ],
              ),
            );
          },
        ),
        bottomNavigationBar: BuyBottom(totalPrice:_finalTotalAmount,),
      ),
      
    );
    
  }

  Future<bool> _onBackPressed() async {
    await Payments.deleteAllPayments();
    return true;
  }
}
