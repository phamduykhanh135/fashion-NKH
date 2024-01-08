import 'package:flutter/material.dart';
import 'package:sales_application/views/pie_chart.dart';
import 'package:sales_application/views/quanlysanpham.dart';
import 'package:sales_application/views/suasanpham.dart';
import 'package:sales_application/views/themsanpham.dart';
import 'package:sales_application/views/thongke.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
       home:QuanLySP()
      // initialRoute: "/login",
      // routes: {
      //   "/login":(context)=>const Login_Screen(),
      //  "/menu":(context)=>const Menu_Screen(),
      //  "/personal":(context)=>const Personal_Screen()
      //},
    );
  }
}

