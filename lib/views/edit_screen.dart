import 'package:flutter/material.dart';

import '../model/user.dart';

class Edit_Screen extends StatefulWidget {
  final void Function(int) onUpdate;
  const Edit_Screen(
      {super.key,
      required this.name_edit,
      required this.sst,
      required this.onUpdate});
  final String name_edit;
  final int sst;

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  late UserModel user = UserModel();
  TextEditingController name = TextEditingController();
  void someFunction() {
    // Thực hiện các thao tác và khi cần cập nhật trạng thái của trang trước đó
    widget.onUpdate(1); // Gọi hàm callback từ trang trước đó
  }
  @override
  void initState() {
    super.initState();
    getData();
    // Đặt giá trị ban đầu từ widget.name_edit
  }
  Future<void> getData() async {
    UserModel? userData = await FirestoreService().getUserData();
    if (userData != null) {
      setState(() {
        user = userData;
        getName();
      });
    }
  }
  Future<void> getName() async {
    if(widget.sst==1) {
      name.text = user.fullname;
    } 
    if(widget.sst==2) {
      name.text = user.phone;
    } 
    if(widget.sst==3) {
      name.text = user.email;
    } 
    if(widget.sst==4) {
      name.text = user.address;
    } 
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Sửa ${widget.name_edit}"),
        actions: [
          TextButton(
              onPressed: () {
                updateUserInfo(name.text, widget.sst);
                someFunction();
              },
              child: Container(
                child: const Row(
                  children: [
                    Text(
                      "Lưu",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                ),
              ))
        ],
        backgroundColor: Colors.pink.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: name,
                cursorColor: Colors.grey,
                style: const TextStyle(color: Colors.grey),
                decoration: InputDecoration(
                  labelText: widget.name_edit,
                  labelStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.grey.shade200,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.grey, // Border color when focused
                      width: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
