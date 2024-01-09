import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class item_buy extends StatefulWidget {
  const item_buy({super.key});

  @override
  State<item_buy> createState() => _item_buyState();
}

class _item_buyState extends State<item_buy> {
  Color myLightGrayColor = Color.fromRGBO(243, 243, 243, 1.0);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      
      child: Row(
        children: [
        Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
          color: myLightGrayColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
      
        ),
        child: Row(
          children: [
          Image.network(
            'https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756',
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height /6,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
                Text("Áo thun",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                SizedBox(height: 5,),
                Text("Size: S",style: TextStyle(fontSize: 16,)),
                SizedBox(height: 5,),
                Text("100000 VND",style: TextStyle(fontSize: 16,),),
                SizedBox(height: 5,),
                Text("số lượng: 1",style: TextStyle(fontSize: 16,)),
                
              ],
            )
        ]),
     
    )
        ],
      ));
  }
}