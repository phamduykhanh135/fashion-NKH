import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class buy_bottom extends StatelessWidget {
  const buy_bottom({super.key});

  @override
  Widget build(BuildContext context) {
    Color myColor = Color(0xFF8E1C68);
    return Container(
        height: 60, 
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text("Tổng tiền",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  Text("100.000VND",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)), 
                ],  
              ),

              ElevatedButton(
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
                },
                child: Text(
                  'Thanh toán',
                  style: TextStyle(color: myColor,fontSize: 18),
                ),
              ),
            ],
          ),
            
          )
        );
}
}