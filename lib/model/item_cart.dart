import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item_cart extends StatefulWidget {
  const Item_cart({super.key, required this.ischeck, required this.onCheckboxChanged});
   final bool ischeck;
  final Function(bool) onCheckboxChanged;
  @override
  State<Item_cart> createState() => _Item_cartState();
}

class _Item_cartState extends State<Item_cart> {
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
              onPressed: () {
                // Thực hiện xóa mục
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
   int temp=0;
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
              });
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
                  'https://cdn2.yame.vn/pimg/ao-thun-co-tron-seventy-seven-02-0022708/32909fef-c041-4200-0fcc-001ae3b66ae0.jpg?w=540&h=756',
                  width: MediaQuery.of(context).size.width / 6,
                  height: MediaQuery.of(context).size.height / 6,
                  fit: BoxFit.contain,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    SizedBox(height: 10,),
                    const Text("Áo thun",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                    SizedBox(height: 10,),
                    Text("100000 VND",style: TextStyle(fontSize: 18,)),
                    SizedBox(height: 10,),
                    Text("Size: S",style: TextStyle(fontSize: 18)),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                           setState(() {
                              if(temp>0)
                            {
                              temp--;
                            }
                           });
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
                        Text(temp.toString(), style: TextStyle(fontSize: 20.0)),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              if(temp>=0)
                            {
                              temp++;
                            }
                           });
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
                          onPressed: () {
                            _showConfirm();
                          },
                          icon: Icon(Icons.delete),
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