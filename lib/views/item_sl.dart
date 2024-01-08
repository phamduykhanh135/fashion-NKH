import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
class ItemSL extends StatefulWidget {
  const ItemSL({super.key});

  @override
  State<ItemSL> createState() => _ItemSLState();
}

class _ItemSLState extends State<ItemSL> {
  //FilteringTextInputFormatter onlyDigits = FilteringTextInputFormatter.allow(RegExp(r'[0-9]'));
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration:  BoxDecoration(
          color:  Color.fromRGBO(243, 243, 243, 1),
          borderRadius: BorderRadius.circular(30.0)
      ),
      child: Row(
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Giảm giá")],)),
          Expanded( flex: 2,
              child: Container(
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Enter number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color:  Color.fromRGBO(142, 28, 104, 1), width: 2.0),
                      ),
                      isDense: true, // Cung cấp khoảng trắng thấp hơn giữa nội dung và đường biên
                      alignLabelWithHint: true,

                    ),
                  textAlign: TextAlign.center,
                ),
              ))
        ],
      ),
    );
  }
}
