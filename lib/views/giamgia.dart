import 'package:flutter/material.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/views/item_sl.dart';
import 'package:sales_application/views/color.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/themsanpham.dart';
class GiamGia extends StatefulWidget {
  const GiamGia({super.key});

  @override
  State<GiamGia> createState() => _GiamGiaState();
}

class _GiamGiaState extends State<GiamGia> {
  var _giamgia=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Giảm giá",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          TextButton(onPressed: (){
            Them.discount_sp=int.parse(_giamgia.text);
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => ThemSP()),);
          }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
        ],

      ),
      body:  Container(
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
              children: [Text("Giảm giá")],)),
            Expanded( flex: 2,
                child: Container(
                  child: TextFormField(

                    controller:_giamgia,
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
      )
    );
  }
}
