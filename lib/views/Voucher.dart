import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../model/Item_Voucher.dart';
class Voucher extends StatefulWidget {
  const Voucher({super.key});

  @override
  State<Voucher> createState() => _VoucherState();
}

class _VoucherState extends State<Voucher> {
  Color myColor = Color(0xFF8E1C68);
   TextEditingController _voucherController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text("Chọn voucher",style: TextStyle(color: myColor)),
       iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
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
