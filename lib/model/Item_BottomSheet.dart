import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/views/Detail_Screen.dart';
import '../data/product_Reader.dart';
import '../views/cart.dart';

import 'container_Detail.dart';
class Item_bottomSheet extends StatefulWidget {
  final Products product;
  const Item_bottomSheet({super.key, required this.product});
  

  @override
  State<Item_bottomSheet> createState() => _Item_bottomSheetState();
}

class _Item_bottomSheetState extends State<Item_bottomSheet> {
  int temp=0;
  @override
  
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height/1.2 ,
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                widget.product.image
                ,
                fit: BoxFit.contain,
                height: MediaQuery.of(context).size.height / 5,
                width: MediaQuery.of(context).size.width / 5,
              ),
              SizedBox(width: 120),
              Text("${widget.product.price}.000",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                     Item_Container(product: widget.product,),
                  ],
                ),
               Row(
                children: [
                Text("Số lượng:"),
                SizedBox(width: 130,),
                Container(child: Row(
                 
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.white),
                        side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          if (temp > 0) {
                            temp--;
                          }
                        });
                      },
                      child: Icon(Icons.remove, color: Colors.black),
                    ),

                     SizedBox(width: 20,),
                    Text(temp.toString()),
                     SizedBox(width: 20,),
                    TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (temp >= 0) {
                          temp++;
                        }
                      });
                    },
                    child: Icon(Icons.add, color: Colors.black),
                  ),

                  ],
                ),),

               ],),
               SizedBox(height: 10,),
               Container(
                decoration: BoxDecoration(
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: TextButton(
                  style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.pink.shade100,),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),),),
                onPressed: () {
  Navigator.pop(context); // Close the bottom sheet
  showSuccessDialog(context);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => DetailScreen(),
    ),
  );
},
    child: const Text("Xác nhận",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.purple),)),
               )
              ],
            
            ),
          ),
        ],
      ),
    );
  }
}
void showSuccessDialog(BuildContext context) {
  if (context != null) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        Future.delayed(Duration(seconds: 1), () {
         Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(),
              ),
              // Use a condition that always evaluates to true to remove all previous routes
              (route) => true,
            );
        });
        return const AlertDialog(
          content: Text("Đã thêm sản phẩm vào giỏ hàng thành công"),
        );
      },
    );
  }
}

