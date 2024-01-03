import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item_cart extends StatefulWidget {
  const Item_cart({super.key});

  @override
  State<Item_cart> createState() => _Item_cartState();
}

class _Item_cartState extends State<Item_cart> {
   bool ischeck=false;
   int temp=0;
  @override
  Widget build(BuildContext context) {
   
    return Container(
      padding: EdgeInsets.all(10),
      
      child: Row(
        children: [
        Checkbox(value: ischeck, onChanged: (bool? value){
          setState(() {
            ischeck = value!;
          });
        }),

        Container(
        padding: EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width / 1.2,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Áo thun"),
                Text("100000"),
                Row(
                  
                  children: [
                SizedBox(width: 10,),
                  TextButton(onPressed: (){
                    setState(() {
                      if(temp>0)
                      {
                        temp--;
                      }
                      else{
                        temp=0;
                      }
                    });
                  }, child: Icon(Icons.remove),style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black))),
                  SizedBox(width: 10,),
                  Text(temp.toString()),
                  SizedBox(width: 10,),
                  
                  TextButton(onPressed: (){
                    setState(() {
                      if(temp>=0)
                      {
                        temp++;
                      }
                    });
                  },
                
                   child: Icon(Icons.add),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black))),
                   SizedBox(width: 10,),
                  
                  IconButton(onPressed: (){}
                  , icon: const Icon(Icons.delete))
                ],)
              ],
            )
        ]),
     
    )
        ],
      ));
  }
}