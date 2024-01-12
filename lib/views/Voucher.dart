import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/data/voucher_Reader.dart';

import '../model/Item_Voucher.dart';
class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  List<Vouchers>? _voucher;
  Color myColor = Color(0xFF8E1C68);
  
   TextEditingController _voucherController = TextEditingController();
   void _loadData() async {
    await Vouchers.loadData_voucher();
    setState(() {
      _voucher = Vouchers.voucher;
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
     appBar: AppBar(title: Text("Chọn voucher",style: TextStyle(color: myColor)),
       iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
       ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('voucher').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Text('Error: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (_voucher == null || _voucher!.isEmpty) {
            return const Center(
              child: Text('Waiting for data to load...', style: TextStyle(fontSize: 20)),
              
            );
          }

          if (snapshot.hasData && snapshot.data != null) {
            _voucher = snapshot.data!.docs
                .map((doc) => Vouchers.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
          }

          if (_voucher == null) {
            return Text('Data is null');
          }

          return ListView(
        padding: EdgeInsets.all(5.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextFormField(
                  controller: _voucherController,
                  decoration: InputDecoration(
                    labelText: 'Nhập mã voucher',
                    hintText: 'Nhập mã voucher của bạn',
                  ),
                ),
              ),
              SizedBox(width: 16.0),
              ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                    minimumSize: MaterialStateProperty.all(const Size(80, 30)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Xử lý khi người dùng nhấn nút
                  
                  },
                  child: Text(
                    'Áp dụng',
                    style: TextStyle(color: myColor),
                  ),)
            ],
          ),
          const Divider( // Đường gạch chân dưới
      color: Colors.grey, // Màu sắc của gạch chân
      thickness: 1, // Độ dày của gạch chân
    ),
    Text("voucher ưa đãi"),
    ListView.builder(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    itemCount: _voucher!.length,
    itemBuilder: (BuildContext context, int index) {
      return  Item_voucher(voucher: _voucher![index],); 
    },
  ),
        ],
        
      );
        },
      ),
      
    );
  }
}
