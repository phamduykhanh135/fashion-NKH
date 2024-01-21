import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/language_presenter.dart';
import '../presenters/resuable_widget.dart';

class Change_Password_screen extends StatefulWidget {
  const Change_Password_screen({super.key});

  @override
  State<Change_Password_screen> createState() => _Change_Password_screenState();
}

class _Change_Password_screenState extends State<Change_Password_screen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration:
              BoxDecoration(color: Colors.pink.shade100.withOpacity(0.1)),
          child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            height: 150,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.pink,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          )),
                          Expanded(
                            child: Image.asset(
                              "assets/logo.png",
                              height: 150,
                              width: 150,
                            ),
                          ),
                          const Expanded(child: Text(""))
                        ],
                      ),
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
                        child: resuableTexFile(
                          "Email",
                          Icons.email,
                          false,
                          false,
                          emailTextController,
                          (value) {
                            if (value != null && value.isNotEmpty) {
                              if (!EmailValidator.validate(value)) {
                                return LanguagePresenter
                                    .language.enterEmailValid;
                              }
                            } else {
                              return LanguagePresenter.language.notBeEmpty;
                            }
                            return null;
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
                            offset:
                                const Offset(0, 5), // Offset in the Y direction
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () async {
                          final isVail = formKey.currentState!.validate();
                          if (!isVail) return;
                          String email = emailTextController.text;
                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: email);
                            // Thông báo cho người dùng rằng liên kết đã được gửi
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  'Liên kết đổi mật khẩu đã được gửi đến email $email'),
                            ));
                          } catch (e) {
                            // Xử lý lỗi (ví dụ: email không tồn tại)
                            print('Error: $e');
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateColor.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.red;
                            }
                            return Colors.pink.shade100;
                          }),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
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
              ))),
    );
  }
}
