import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; 
import '../data/address_Reader.dart';

class add_Address extends StatefulWidget {
  const add_Address({Key? key}) : super(key: key);

  @override
  State<add_Address> createState() => _add_AddressState();
}

class _add_AddressState extends State<add_Address> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  Color myColor = Color(0xFF8E1C68);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thêm địa chỉ mới", style: TextStyle(color: myColor)),
        iconTheme: IconThemeData(color: myColor),
        backgroundColor: Colors.pink.shade100,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
          TextFormField(
          controller: _fullNameController,
          decoration: const InputDecoration(
            labelText: 'Họ và tên',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black), // Màu viền khi trường được focus
            ),
            labelStyle: TextStyle(color: Colors.black), // Màu label
          ),
        ),
            SizedBox(height: 10),
            TextFormField(
              controller: _phoneController,
              decoration: const InputDecoration(
              labelText: 'Số điện thoại',
              focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            labelStyle: TextStyle(color: Colors.black),
              ),
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly, // Chỉ cho phép nhập số
                LengthLimitingTextInputFormatter(10), // Giới hạn độ dài tối đa là 10
                TextInputFormatter.withFunction(
                  (oldValue, newValue) {
                    // Số đầu tiên không được là 0
                    if (newValue.text.isNotEmpty && newValue.text[0] == '0') {
                      return newValue;
                    }
                    return oldValue;
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
           TextFormField(
          controller: _addressController,
          decoration: const InputDecoration(
            labelText: 'Địa chỉ',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black), // Màu viền khi trường được focus
            ),
            labelStyle: TextStyle(color: Colors.black), // Màu label
          ),
        ),
            SizedBox(height: 20),
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
                if (_fullNameController.text.isNotEmpty &&
                    _phoneController.text.isNotEmpty &&
                    _addressController.text.isNotEmpty) {
                  Address.addNewaddress(
                    _fullNameController.text,
                    _addressController.text,
                    _phoneController.text,
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Vui lòng điền đầy đủ thông tin.'),
                    ),
                  );
                }
              },
              child: Text('Lưu địa chỉ', style: TextStyle(color: myColor, fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
