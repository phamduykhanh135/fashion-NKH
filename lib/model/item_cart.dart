import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sales_application/data/cart_Reader.dart';
import 'package:sales_application/data/product_Reader.dart';

class Item_cart extends StatefulWidget {
  final Carts carts;
  const Item_cart({super.key, required this.ischeck, required this.onCheckboxChanged, required this.carts, required this.onQuantityChanged});
   final bool ischeck;
  final Function(bool) onCheckboxChanged;
  final VoidCallback onQuantityChanged;
  @override
  State<Item_cart> createState() => _Item_cartState();
}

class _Item_cartState extends State<Item_cart> {
  List<Carts> selectedItems = [];
  bool _ischeck = false;
  Color myLightGrayColor = Color.fromARGB(255, 245, 227, 227);
  Future<void> _showConfirm() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
           backgroundColor: Color.fromARGB(255, 239, 232, 232),
          title: const Text('Bạn có muốn xóa?',textAlign: TextAlign.center),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              TextButton(
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 255, 255)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
              ),
              onPressed: () {
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Hủy',style: TextStyle(color: Colors.black)),
            ),
            
            TextButton(
              style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.pink.shade100),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    ),
              ),
              onPressed: () async{
                await Carts.deleteCart(widget.carts.id.toString());
                Navigator.of(context).pop(); // Đóng dialog
              },
              child: const Text('Xóa',style: TextStyle(color: Colors.black)),
            ),
            ],)
          ],
        );
      },
    );
  }
   
     @override
  void initState() {
    super.initState();
    _ischeck = widget.ischeck;
  }

  @override
  void didUpdateWidget(covariant Item_cart oldWidget) {
    super.didUpdateWidget(oldWidget);
    _ischeck = widget.ischeck;
  }
  @override
  Widget build(BuildContext context) {
   
     return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Checkbox(
        checkColor: Colors.black,
        fillColor: MaterialStateProperty.all(Colors.pink.shade100),
        side: BorderSide(color: Colors.black),
        value: _ischeck,
        onChanged: (bool? value) {
          setState(() {
            _ischeck = value ?? false;
            if (_ischeck) {
              selectedItems.add(widget.carts);
            } else {
              selectedItems.remove(widget.carts);
            }
          });
          widget.onCheckboxChanged(_ischeck);

          // Check if the checkbox is unchecked and remove from selectedItems
          if (!_ischeck) {
            selectedItems.remove(widget.carts);
          }

          widget.onCheckboxChanged(_ischeck);
        },
      ),
          

          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 1.2,
            decoration: BoxDecoration(
              color: myLightGrayColor,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Row(
              
              children: [
                Image.network(
                  widget.carts.image,
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 6,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 30,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 10,),
                     Text(widget.carts.name,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Text(widget.carts.price.toStringAsFixed(3),style: TextStyle(fontSize: 18,)),
                    SizedBox(height: 10,),
                    Text("Size:${widget.carts.size}",style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () async{
                           setState(() {
                              if(widget.carts.quality>0)
                            {
                              widget.carts.quality--;
                            }
                           });
                           await FirebaseFirestore.instance.collection('carts').doc(widget.carts.id.toString()).update({
                            'quality': widget.carts.quality,
                          });
                          widget.onCheckboxChanged(_ischeck);
                           widget.onQuantityChanged();
                          },
                          child: Icon(Icons.remove),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            minimumSize: MaterialStateProperty.all(const Size(1, 1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(widget.carts.quality.toString(), style: TextStyle(fontSize: 20.0)),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () async{
                            setState(() {
                              if(widget.carts.quality>=0)
                            {
                              widget.carts.quality++;
                            }
                           });
                           
                           await FirebaseFirestore.instance.collection('carts').doc(widget.carts.id.toString()).update({
                            'quality': widget.carts.quality,
                          });
                          widget.onCheckboxChanged(_ischeck);
                           widget.onQuantityChanged();//thay đổi số lượng
                          },
                          child: Icon(Icons.add),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.black),
                            minimumSize: MaterialStateProperty.all(const Size(1, 1)),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: (){
                            
                            _showConfirm();
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}