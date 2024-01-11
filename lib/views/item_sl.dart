import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/color.dart';
class ItemSL extends StatefulWidget {
  ItemSL({super.key,this.titlePage, this.atributte});
  final String? titlePage;
  final int? atributte;

  @override
  State<ItemSL> createState() => _ItemSLState();
}

class _ItemSLState extends State<ItemSL> {
  final _text=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration:  BoxDecoration(
          color:  MyColor.light_grey,
          borderRadius: BorderRadius.circular(30.0)
      ),
      child: Row(
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(widget.titlePage.toString())],)),
          Expanded( flex: 2,
              child: Container(
                child: TextFormField(
                  controller:_text,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'Enter number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: MyColor.dark_pink, width: 2.0),
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
