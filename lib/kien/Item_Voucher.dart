import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item_voucher extends StatefulWidget {
  const Item_voucher({super.key});

  @override
  State<Item_voucher> createState() => _Item_voucherState();
}

class _Item_voucherState extends State<Item_voucher> {
  bool _ischeck = false;
  Color myLightGrayColor = Color.fromRGBO(243, 243, 243, 1.0);
  @override
  Widget build(BuildContext context) {
   return Container(
      margin: EdgeInsets.all(5),
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
            },
          ),
          Container(
            padding: const EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width / 1.35,
            decoration: BoxDecoration(
              color:myLightGrayColor,
              borderRadius: BorderRadius.all(const Radius.circular(8)),
            ),
            child: Row(
              children: [
                Image.network(
                  'https://as2.ftcdn.net/v2/jpg/00/98/48/35/1000_F_98483558_NdOgudtcKCXsNk7QeVsJtklqwxuoFGbS.jpg',
                  width: MediaQuery.of(context).size.width / 10,
                  height: MediaQuery.of(context).size.height / 10,
                  fit: BoxFit.contain,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Free Ship", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          "Free ship áp dụng cho hóa đơn trên 500.000 VND",
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}