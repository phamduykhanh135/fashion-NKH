import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Change_Password_screen extends StatefulWidget {
  const Change_Password_screen({super.key});

  @override
  State<Change_Password_screen> createState() => _Change_Password_screenState();
}

class _Change_Password_screenState extends State<Change_Password_screen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailTextController = TextEditingController();
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration:  BoxDecoration(
        color: Colors.pink.shade100.withOpacity(0.1)

          ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
              children: [
                SizedBox(
                  height: 40,
                  // decoration: BoxDecoration(
                  //   color: Colors.pink.shade100,
                  //   borderRadius: BorderRadius.circular(10),
                  //   border: Border.all(width: 2,color: Colors.pink)
                  // ),
                  child: IconButton(
                    
                    icon: const Icon(Icons.arrow_back,color: Colors.pink,size: 30,),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              child: Text(
                "Đổi mật khẩu",
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
              height: 40,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: TextFormField(
                controller: emailTextController,
                cursorColor: Colors.pink,
                style: TextStyle(color: Colors.pink.withOpacity(0.9)),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  labelText: "Email",
                  labelStyle: const TextStyle(color: Colors.white),
                  filled: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  fillColor: Colors.pink.withOpacity(0.1),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide:
                          const BorderSide(width: 0, style: BorderStyle.none)),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      color: Colors.pink, // Border color when focused
                      width: 1.0,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
           
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
               onPressed: () async {
                String email = emailTextController.text;
                try {
                  await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                  // Thông báo cho người dùng rằng liên kết đã được gửi
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Liên kết đổi mật khẩu đã được gửi đến email $email'),
                  ));
                } catch (e) {
                  // Xử lý lỗi (ví dụ: email không tồn tại)
                  print('Error: $e');
                }
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
                  "Xác nhận",
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
    ));
  }
}
