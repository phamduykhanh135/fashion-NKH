import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'Item_Voucher.dart';
class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
   TextEditingController _voucherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chọn Voucher"),
      ),
      body: ListView(
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
                onPressed: () {
                  // Xử lý nút nhấn ở đây
                  String voucherCode = _voucherController.text;
                  
                },
                child: Text('Áp dụng'),
              ),
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
    itemCount: 2,
    itemBuilder: (BuildContext context, int index) {
      return const Item_voucher(); 
    },
  ),
        ],
        
      ),
      
    );
  }
}
