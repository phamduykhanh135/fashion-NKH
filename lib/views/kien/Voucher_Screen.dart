import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sales_application/data/kien/voucherSale_Reader.dart';
import '../../model/kien/Item_vouchersale.dart';

class Voucher extends StatefulWidget {
  final double totalPrice;
  final void Function(double) onVoucherSelected;

  const Voucher({Key? key, required this.onVoucherSelected, required this.totalPrice}) : super(key: key);

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  int _selectedVoucherMoney = 0;
  String? _selectedVoucherId;
  List<VoucherSales>? _voucherSale;
  Color myColor = Color(0xFF8E1C68);
  TextEditingController _voucherController = TextEditingController();

  void _loadData() async {
    await VoucherSales.loadData_voucher();
    setState(() {
      _voucherSale = VoucherSales.voucher;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

 void _confirmVoucher() {
  double selectedVoucherValue = getSelectedVoucherValue();
  print('Selected Voucher Value: $selectedVoucherValue');
  print('Selected Voucher Money: $_selectedVoucherMoney');
  print('Selected Voucher Value: ${widget.totalPrice}');

  if (selectedVoucherValue > 0.0) {
    if (widget.totalPrice > _selectedVoucherMoney) {
      widget.onVoucherSelected(selectedVoucherValue);
      Navigator.pop(context, selectedVoucherValue);
    } else {
      // Hiển thị thông báo không phù hợp nếu giá trị voucher không đủ
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thông báo'),
            content: const Text('Giá trị đơn hàng không đủ để áp dụng cho voucher này.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  } else {
    print('No voucher selected or invalid value');
  }
}


  double getSelectedVoucherValue() {
    if (_selectedVoucherId != null) {
      VoucherSales? selectedVoucher = _voucherSale?.firstWhere((voucher) => voucher.id == _selectedVoucherId);
      if (selectedVoucher != null) {
        return selectedVoucher.value.toDouble();
      }
    }
    return 0.0;
  }

  void _updateVoucherSale(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData && snapshot.data != null) {
      _voucherSale = snapshot.data!.docs
          .map((doc) => VoucherSales.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn voucher", style: TextStyle(color: myColor)),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('voucherSale').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (_voucherSale == null || _voucherSale!.isEmpty) {
            return const Center(
              child: Text('Waiting for data to load...', style: TextStyle(fontSize: 20)),
            );
          }

          _updateVoucherSale(snapshot);

          return ListView(
            padding: EdgeInsets.all(5.0),
            children: [
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Expanded(
            //         child: TextFormField(
            //           controller: _voucherController,
            //           decoration:const InputDecoration(
            //             labelText: 'Nhập mã voucher',
            //             hintText: 'Nhập mã voucher của bạn',
            //             focusedBorder: OutlineInputBorder(
            //   borderSide: BorderSide(color: Colors.black), // Màu viền khi trường được focus
            // ),
            // labelStyle: TextStyle(color: Colors.black), 
            //           ),
                      
            //         ),
            //       ),
            //       SizedBox(width: 16.0),
            //       ElevatedButton(
            //         style: ButtonStyle(
            //           backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
            //           minimumSize: MaterialStateProperty.all(const Size(80, 30)),
            //           shape: MaterialStateProperty.all(
            //             RoundedRectangleBorder(
            //               borderRadius: BorderRadius.circular(10),
            //             ),
            //           ),
            //         ),
            //         onPressed: () {
            //           _confirmVoucher();
            //         },
            //         child: Text(
            //           'Áp dụng',
            //           style: TextStyle(color: myColor),
            //         ),
            //       )
              //   ],
              // ),
              // const Divider(
              //   color: Colors.grey,
              //   thickness: 1,
              // ),
              Text("danh sách voucher ưa đãi giảm giá:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              if (_voucherSale != null && _voucherSale!.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: _voucherSale!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemVoucherSale(
                      voucher: _voucherSale![index],
                      selectedVoucherId: _selectedVoucherId,
                      onChanged: (value) {
                        setState(() {
                          _selectedVoucherId = value;
                        });
                      },
                      onChangedMoney: (money) {
                        setState(() {
                          _selectedVoucherMoney = money;
                        });
                      },
                    );
                  },
                ),
            ],
          );
        },
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                      minimumSize: MaterialStateProperty.all(const Size(360, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      _confirmVoucher();
                    },
                    child: Text(
                      'Xác nhận',
                      style: TextStyle(color: myColor, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
