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
              border: Border.all(color: Colors.blue),
              borderRadius: BorderRadius.all(const Radius.circular(8)),
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
                    Text("Áo thun"),
                    Text("100000 VND"),
                    Text("Size: S"),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            
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
                        Text("0", style: TextStyle(fontSize: 20.0)),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {},
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
                          onPressed: () {},
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