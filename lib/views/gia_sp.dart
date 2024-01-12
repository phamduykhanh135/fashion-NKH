import 'package:flutter/material.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/views/item_sl.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/themsanpham.dart';
import 'color.dart';

class GiaSP extends StatefulWidget {
  const GiaSP({super.key});

  @override
  State<GiaSP> createState() => _GiaSPState();
}

class _GiaSPState extends State<GiaSP> {
  var _giaban=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giá bán",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          actions: [
            TextButton(onPressed: (){
              Them.price_sp=int.parse(_giaban.text);
              Navigator.push( context,
                MaterialPageRoute(builder: (context) => ThemSP()),);
            }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
          ],

        ),
        body:   Container(
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
                children: [Text("Giá bán")],)),
              Expanded( flex: 2,
                  child: Container(
                    child: TextFormField(
                      controller:_giaban,
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
                        isDense: true,
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