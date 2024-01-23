import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/presenters/language_presenter.dart';

import '../models/user.dart';

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
    if (widget.sst == 1) {
      name.text = user.fullname;
    }
    if (widget.sst == 2) {
      name.text = user.phone;
    }
    if (widget.sst == 3) {
      name.text = user.email;
    }
    if (widget.sst == 4) {
      name.text = user.address;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sửa ${widget.name_edit}",
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
              onPressed: () {
                updateUserInfo(name.text, widget.sst);
                someFunction();
                showSaveSuccessSnackBar();
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
              keyboardType: widget.sst == 2
                  ? TextInputType
                      .phone // Nếu là số điện thoại, sử dụng TextInputType.phone
                  : TextInputType.emailAddress,
              inputFormatters: widget.sst == 2
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : [], // Chỉ cho phép nhập chữ số nếu là số điện thoại
              maxLength: widget.sst == 2
                  ? 10
                  : null, // Giới hạn độ dài số điện thoại nếu là số điện thoại
              validator: (value) {
                if (widget.sst == 1) {
                  if (value == null || value.isEmpty) {
                    return "${LanguagePresenter.language.fullName} ${LanguagePresenter.language.notBeEmpty}";
                  }
                  return null; // Valid
                }
                if (widget.sst == 2) {
                  if (value == null || value.isEmpty) {
                    return LanguagePresenter.language.notBeEmpty;
                  }
                  if (value.length < 10) {
                    return LanguagePresenter.language.invalidphonenumber;
                  }
                  return null;
                }
                if (widget.sst == 3) {
                  if (value != null && !EmailValidator.validate(value)) {
                    return LanguagePresenter.language.enterEmailValid;
                  }
                  if (value == null || value.isEmpty) {
                    return LanguagePresenter.language.notBeEmpty;
                  }
                  return null;
                }
                if (widget.sst == 4) {
                  if (value == null || value.isEmpty) {
                    return LanguagePresenter.language.notBeEmpty;
                  }
                  return null;
                }
                return null;
              },
            ),
          ),
        ],
      )),
    );
  }

  void showSaveSuccessSnackBar() {
    const snackBar = SnackBar(
      content: Text('Lưu thành công!'),
      backgroundColor: Colors.green, // Màu nền của Snackbar
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
