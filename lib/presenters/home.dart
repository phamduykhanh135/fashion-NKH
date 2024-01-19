import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/views/menu_dart.dart';
import 'package:sales_application/views/sigin_in_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
      return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state while checking authentication status
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          // User is already logged in
          return const Menu_Screen();
        } else {
          // User is not logged in
          return const SiginIn_Screen();
        }
      },
    );
  }
}