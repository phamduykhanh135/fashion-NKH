import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../views/buy.dart';

class Cart_ElevatedButton extends StatelessWidget {
  const Cart_ElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF8E1C68);
    return ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.pink.shade100),
                  minimumSize: MaterialStateProperty.all(const Size(120, 50)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Buy_Screen()),
                  );
                },
                child: Text(
                  'Thanh toán',
                  style: TextStyle(color: myColor,fontSize: 18),
                ),
  );
  }
}