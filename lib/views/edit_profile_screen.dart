import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:sales_application/views/edit_screen.dart';
import 'package:sales_application/views/upload_image.dart';

import '../models/user.dart';
import 'personal_screen.dart';

class Edit_Profile_Screen extends StatefulWidget {
  final void Function(int) onUpdate;
  const Edit_Profile_Screen({super.key, required this.onUpdate});

  @override
  State<Edit_Profile_Screen> createState() => _Edit_Profile_ScreenState();
}

class _Edit_Profile_ScreenState extends State<Edit_Profile_Screen> {
  @override
  late UserModel user = UserModel();
  bool isChanges = false;
  int shouldUpdate = 0;

  void updateState(int value) {
    print("haaaaaaaaaaaaaaaaaaa");
    setState(() {
      shouldUpdate = value;
      getData();
      print("bbbbbbbbbbbbbbbb");
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    UserModel? userData = await FirestoreService().getUserData();
    if (userData != null) {
      setState(() {
        user = userData;
      });
    }
  }

  void someFunction() {
    // Thực hiện các thao tác và khi cần cập nhật trạng thái của trang trước đó
    widget.onUpdate(1); // Gọi hàm callback từ trang trước đó
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Cài đặt",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.pink.shade100,
        leading:IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back,color: Colors.white,)) ,
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
              child: GestureDetector(
                  onTap: changeAvatar, child: buildAvatarUser(user.image)),
            ),
            if (isChanges == true)
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Đặt bán kính để làm tròn góc
                            ),
                            backgroundColor: Colors.pink.shade100),
                        onPressed: () {
                          updateUserDataWithImage(user.image);
                          someFunction();
                          changeButton();
                        },
                        child: const Text("Lưu"))
                  ],
                ),
              ),
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 10, 10),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit_Screen(
                                    name_edit: "Tên",
                                    sst: 1,
                                    onUpdate: updateState,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Tên: ${user.fullname}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit_Screen(
                                    name_edit: "Số điện thoại",
                                    sst: 2,
                                    onUpdate: updateState,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Số điện thoại: ${user.phone}',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit_Screen(
                                    name_edit: "Email",
                                    sst: 3,
                                    onUpdate: updateState,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Email: ${user.email}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Edit_Screen(
                                    name_edit: "Địa chỉ",
                                    sst: 4,
                                    onUpdate: updateState,
                                  )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade200,
                      ),
                      child: SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                'Địa chỉ: ${user.address}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                                // overflow: TextOverflow
                                //     .ellipsis, // Chọn một trong các giá trị: ellipsis, clip, fade
                                // maxLines: 1, // Số dòng tối đa hiển thị
                                // softWrap: false, // Ngăn chặn xuống hàng tự động
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  changeAvatar() async {
    Uint8List? image = await uploadImage();
    if (image != null) {
      user.image = image;
      print(image);
      setState(() {
        isChanges = true;
      });
    }
  }

  changeButton() async {
    if (isChanges == true) {
      setState(() {
        isChanges = false;
      });
    }
  }
}
