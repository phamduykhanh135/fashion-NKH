import 'package:flutter/material.dart';

import 'menu_dart.dart';

class SiginIn_Screen extends StatefulWidget {
  const SiginIn_Screen({super.key});

  @override
  State<SiginIn_Screen> createState() => _SiginIn_ScreenState();
}

class _SiginIn_ScreenState extends State<SiginIn_Screen> {
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
                "Đăng nhập",
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
                    "Đăng nhập",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )),
            ),
            Container(
              width: 200,
              height: 35,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () async {
                  // Handle Google Sign-In here
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green, // Change to Colors.none if needed
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'images/google.png', // Replace with your image asset path
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Text(
                      'Sign in with Google',
                      style: TextStyle(color: Color.fromARGB(255, 4, 67, 6)),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 200,
              height: 35,
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(90)),
              child: ElevatedButton(
                onPressed: () async {
                  // Handle Google Sign-In here
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.green, // Change to Colors.none if needed
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        'images/email.png', // Replace with your image asset path
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const Text(
                      'Sign in with Email',
                      style: TextStyle(color: Color.fromARGB(255, 4, 67, 6)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
    );
  }
}
