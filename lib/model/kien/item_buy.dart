import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../../data/kien/payment_Reader.dart';

class item_buy extends StatefulWidget {
  final Payments payment; 
  const item_buy({super.key, required this.payment});

  @override
  State<item_buy> createState() => _item_buyState();
}

class _item_buyState extends State<item_buy> {
  Color myLightGrayColor = Color.fromRGBO(243, 243, 243, 1.0);
  @override
  Widget build(BuildContext context) {
    print(widget.payment.idUser);
    return Container(
      padding: EdgeInsets.all(10),
      
      child: Row(
        children: [
        Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          color: myLightGrayColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
      
        ),
        child: Row(
          children: [
          Image.network(
            widget.payment.image,
              width: MediaQuery.of(context).size.width / 6,
              height: MediaQuery.of(context).size.height /6,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5,),
               Container(
                width: MediaQuery.of(context).size.width/1.8,
                child:  Text(widget.payment.name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),softWrap: true),
               ),
                SizedBox(height: 5,),
                Text("Size: ${widget.payment.size}",style: TextStyle(fontSize: 16,)),
                SizedBox(height: 5,),
                
                Text("${widget.payment.price}",style: const TextStyle(fontSize: 16,),),
                SizedBox(height: 5,),
                Text("số lượng: ${widget.payment.quality}",style:  TextStyle(fontSize: 16,)),
                
              ],
            )
        ]),
     
    )
        ],
      ));
  }
}