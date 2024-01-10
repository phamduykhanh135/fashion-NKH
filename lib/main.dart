import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/presenters/menu_dart.dart';
import 'package:sales_application/presenters/personal_screen.dart';
import 'package:sales_application/model/user.dart';
import 'package:sales_application/presenters/change_password_screen.dart';
import 'package:sales_application/presenters/seach_screen.dart';
import 'package:sales_application/presenters/sigin_in_screen.dart';
import 'package:sales_application/presenters/sigin_up_screen.dart';

import 'firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final UserModel? user;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const Menu_Screen()
      initialRoute: "/sigin_in",
      routes: {
        "/sigin_in": (context) => const SiginIn_Screen(),
        "/sigin_up": (context) => const SiginUp_Screen(),
        "/change_password": (context) => const Change_Password_screen(),
        "/menu": (context) => const Menu_Screen(),
        "/search": (context) => const Search_Screen(),
        "/personal": (context) => const Personal_Screen(),
        
      },
    );
  }
}

