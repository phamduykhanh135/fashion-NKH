import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/language_presenter.dart';
import 'package:sales_application/presenters/resuable_widget.dart';
import 'package:sales_application/views/sigin_up_screen.dart';
import '../model/user.dart';

class SiginIn_Screen extends StatefulWidget {
  const SiginIn_Screen({super.key});

  @override
  State<SiginIn_Screen> createState() => _SiginIn_ScreenState();
}

class _SiginIn_ScreenState extends State<SiginIn_Screen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool _isObscure = true;

  // @override
  // initState() {
  //   super.initState();

  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     User? user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       // Nếu đã đăng nhập, chuyển hướng đến trang chủ
  //       Navigator.pushReplacementNamed(context, "/menu");
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.pink.shade100.withOpacity(0.1)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                child: Image.asset(
                  "assets/logo.png",
                  height: 150,
                  width: 150,
                ),
              ),
              Container(
                child: Text(
                  "Đăng nhập",
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
                  "Email",
                  Icons.email,
                  false,
                  false,
                  _emailTextController,
                  (value) {
                    if (value != null && !EmailValidator.validate(value)) {
                      return LanguagePresenter.language.enterEmailValid;
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
                    signIn(context, _emailTextController.text,
                        _passwordTextController.text);
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
                    "Đăng nhập",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(
                width: 150,
                height: 50,
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    border: Border.all(width: 2, color: Colors.pink.shade100)),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SiginUp_Screen(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red;
                      }
                      return Colors.white;
                    }),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: Text(
                    "Đăng ký",
                    style: TextStyle(
                      color: Colors.pink.shade200,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              )

              // Container(
              //   width: 200,
              //   height: 35,
              //   margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(90)),
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       // Handle Google Sign-In here
              //     },
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //         Colors.green, // Change to Colors.none if needed
              //       ),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0)),
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(right: 8.0),
              //           child: Image.asset(
              //             'images/google.png', // Replace with your image asset path
              //             width: 20,
              //             height: 20,
              //           ),
              //         ),
              //         const Text(
              //           'Sign in with Google',
              //           style: TextStyle(color: Color.fromARGB(255, 4, 67, 6)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   width: 200,
              //   height: 35,
              //   margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              //   decoration:
              //       BoxDecoration(borderRadius: BorderRadius.circular(90)),
              //   child: ElevatedButton(
              //     onPressed: () async {
              //       // Handle Google Sign-In here
              //     },
              //     style: ButtonStyle(
              //       backgroundColor: MaterialStateProperty.all<Color>(
              //         Colors.green, // Change to Colors.none if needed
              //       ),
              //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              //         RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(10.0)),
              //       ),
              //     ),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Padding(
              //           padding: const EdgeInsets.only(right: 8.0),
              //           child: Image.asset(
              //             'images/email.png', // Replace with your image asset path
              //             width: 20,
              //             height: 20,
              //           ),
              //         ),
              //         const Text(
              //           'Sign in with Email',
              //           style: TextStyle(color: Color.fromARGB(255, 4, 67, 6)),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
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