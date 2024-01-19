import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/language_presenter.dart';
import 'package:sales_application/presenters/resuable_widget.dart';

import '../model/user.dart';

class SiginUp_Screen extends StatefulWidget {
  const SiginUp_Screen({super.key});

  @override
  State<SiginUp_Screen> createState() => _SiginUp_ScreenState();
}

class _SiginUp_ScreenState extends State<SiginUp_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextController = TextEditingController();
  final TextEditingController _comfirmpasswordTextController =
      TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _fullnNameTextController =
      TextEditingController();
  final TextEditingController _addessTextController = TextEditingController();
  final TextEditingController _phoneTextController = TextEditingController();
  bool _isObscure = true;
    bool _isObscures = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.pink.shade100.withOpacity(0.1)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.pink,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                          child: Image.asset(
                            "assets/logo.png",
                            height: 150,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                child: Text(
                  "Đăng ký tài khoản",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.pink.shade300,
                    shadows: [
                      Shadow(
                        color: Colors.pink.shade100,
                        offset: const Offset(4.0, 4.0),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: resuableTexFile(
                  "Họ tên",
                  Icons.person,
                  false,
                  false,
                  _fullnNameTextController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return "${LanguagePresenter.language.fullName} ${LanguagePresenter.language.notBeEmpty}";
                    }
                    return null; // Valid
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: resuableTexFile(
                  "Email",
                  Icons.email,
                  false,
                  false,
                  _emailTextController,
                  (value) {
                    if (value != null && !EmailValidator.validate(value)) {
                      return LanguagePresenter.language.enterEmailValid;
                    }
                    if (value == null || value.isEmpty) {
                      return LanguagePresenter.language.notBeEmpty;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: resuableTexFile(
                  "Địa chỉ",
                  Icons.location_on,
                  false,
                  false,
                  _addessTextController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return LanguagePresenter.language.notBeEmpty;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: resuableTexFile(
                  "Số điện thoại",
                  Icons.phone,
                  false,
                  true,
                  _phoneTextController,
                  (value) {
                    if (value == null || value.isEmpty) {
                      return LanguagePresenter.language.notBeEmpty;
                    }
                    if (value.length < 10) {
                      return LanguagePresenter.language.invalidphonenumber;
                    }
                    return null;
                  },
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: resuablepassTexFile(
                  "Password",
                  Icons.lock,
                  true,
                  _passwordTextController,
                  (value) {
                    if (value != null && value.isNotEmpty) {
                      if (value.length < 8) {
                        return LanguagePresenter.language.passwordValid;
                      }
                    } else {
                      return LanguagePresenter.language.notBeEmpty;
                    }
                    return null;
                  },
                  _isObscure, // Truyền giá trị _isObscure
                  () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: resuablepassTexFile(
                    "Xác thực mật khẩu",
                    Icons.lock,
                    true,
                    _comfirmpasswordTextController,
                    (value) {
                      if (value != null && value.isNotEmpty) {
                        if (value.length < 8) {
                          return LanguagePresenter.language.passwordValid;
                        } else if (value != _passwordTextController.text) {
                          return "Mật khẩu không khớp";
                        }
                      } else {
                        return LanguagePresenter.language.notBeEmpty;
                      }
                      return null;
                    },
                    _isObscures, // Truyền giá trị _isObscure
                    () {
                      setState(() {
                        _isObscures = !_isObscures;
                      });
                    },
                  )),
              Container(
                width: 150,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withOpacity(0.3), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: const Offset(0, 5), // Offset in the Y direction
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    final isVail = _formKey.currentState!.validate();
                    if (!isVail) return;
                    final newUser = UserModel.info(
                      email: _emailTextController.text,
                      fullname: _fullnNameTextController.text,
                      phone: _phoneTextController.text,
                      address: _addessTextController.text,
                      image: null,
                      admin: false,
                      custom: false,
                    );
                    signUp(context, newUser, _passwordTextController.text);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red;
                      }
                      return Colors.pink.shade100;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

TextFormField resuablepassTexFile(
  String text,
  IconData icon,
  bool isPasswordType,
  TextEditingController controller,
  String? Function(String?)? validator,
  bool isObscure, // Thêm tham số để truyền giá trị _isObscure từ bên ngoài
  VoidCallback toggleObscure, // Thêm callback để cập nhật _isObscure
) {
  return TextFormField(
    controller: controller,
    obscureText: isObscure,
    cursorColor: Colors.pink,
    style: TextStyle(
        color: Colors.pink
            .withOpacity(0.9)), // Sử dụng giá trị được truyền từ bên ngoài
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      suffixIcon: isPasswordType
          ? IconButton(
              icon: Icon(
                isObscure ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
              onPressed:
                  toggleObscure, // Sử dụng callback để cập nhật _isObscure
            )
          : null,
      labelText: text,
      labelStyle: const TextStyle(color: Colors.white),
      filled: true,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      fillColor: Colors.pink.withOpacity(0.1),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.pink, // Border color when focused
          width: 1.0,
        ),
      ),
    ),
  );
}