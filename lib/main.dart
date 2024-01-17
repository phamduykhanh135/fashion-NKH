import 'package:flutter/material.dart';
import 'package:sales_application/views/giamgia_Screen.dart';
import 'package:sales_application/views/loaisp_Screen.dart';
import 'package:sales_application/views/qlsp_Screen.dart';
import 'package:sales_application/views/slkho_Screen.dart';
import 'package:sales_application/views/suasp_Screen.dart';
import 'package:sales_application/views/themsp_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // FlutterError.onError=FirebaseCrashlytics.instance.recordFlutterError;
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
       home: QuanLySP()
      // initialRoute: "/login",
      // routes: {
      //   "/login":(context)=>const Login_Screen(),
      //  "/menu":(context)=>const Menu_Screen(),
      //  "/personal":(context)=>const Personal_Screen()
      //},
    );
  }
}

