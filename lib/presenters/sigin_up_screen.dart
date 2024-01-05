import 'package:flutter/material.dart';

import 'menu_dart.dart';

class SiginUp_Screen extends StatefulWidget {
  const SiginUp_Screen({super.key});

  @override
  State<SiginUp_Screen> createState() => _SiginUp_ScreenState();
}

class _SiginUp_ScreenState extends State<SiginUp_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        // gradient: LinearGradient(colors: [
        //   //hexStringToCoLor("FFC0CB"),
        //   // hexStringToCoLor("FFB6C1"),
        //   // hexStringToCoLor("#FF69B4"),
        //   //  hexStringToCoLor("#FF1493")
        // ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Text(
                "Đăng ký tài khoản",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.green),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: null,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.green.withOpacity(0.9)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.green,
                    ),
                    labelText: "Họ tên",
                    labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),          
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: null,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.green.withOpacity(0.9)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                    labelText: "Số điện thoại",
                    labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: null,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.green.withOpacity(0.9)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.location_on_rounded,
                      color: Colors.green,
                    ),
                    labelText: "Địa chỉ",
                    labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: null,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.green.withOpacity(0.9)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.email,
                      color: Colors.green,
                    ),
                    labelText: "Email",
                    labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: null,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.green.withOpacity(0.9)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.green,
                    ),
                    labelText: "Mật Khẩu",
                    labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: null,
                cursorColor: Colors.green,
                style: TextStyle(color: Colors.green.withOpacity(0.9)),
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock,
                      color: Colors.green,
                    ),
                    labelText: "Nhập lại mật khẩu",
                    labelStyle: TextStyle(color: Colors.green.withOpacity(0.9)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.green.withOpacity(0.2),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none))),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            Container(
              width: 150,
              height: 40,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Menu_Screen()));
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateColor.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          return Colors.black26;
                        }
                        return Colors.green;
                      }),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)))),
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
          
          ],
        ),
      ),
    )
    );
  }
}
