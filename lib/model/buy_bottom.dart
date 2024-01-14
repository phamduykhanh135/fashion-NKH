import 'package:flutter/material.dart';

class BuyBottom extends StatelessWidget {
  final double totalPrice; 

  const BuyBottom({Key? key, required this.totalPrice}) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    Color myColor = const Color(0xFF8E1C68);
    return Container(
      height: 60,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.pink.shade100),
                      minimumSize: MaterialStateProperty.all(const Size(360, 50)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: () {
                      
                    },
                    child: Text(
                      'Thanh toán',
                      style: TextStyle(color: myColor, fontSize: 18),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
