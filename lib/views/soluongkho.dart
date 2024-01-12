import 'package:flutter/material.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/item_sl.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/themsanpham.dart';

class SoLuongKho extends StatefulWidget {
  const SoLuongKho({super.key});

  @override
  State<SoLuongKho> createState() => _SoLuongKhoState();
}

class _SoLuongKhoState extends State<SoLuongKho> {
  var _sizeS=TextEditingController();
  var _sizeM=TextEditingController();
  var _sizeL=TextEditingController();
  var _sizeXL=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Số lượng",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          TextButton(onPressed: (){
            Them.quatitySizeS=int.parse(_sizeS.text);
            Them.quatitySizeM=int.parse(_sizeM.text);
            Them.quatitySizeL=int.parse(_sizeL.text);
            Them.quatitySizeXL=int.parse(_sizeXL.text);
            if(int.parse(_sizeS.text)>0)
              Them.kichco_sp+="S ";
            if(int.parse(_sizeM.text)>0)
              Them.kichco_sp+="M ";
            if(int.parse(_sizeL.text)>0)
              Them.kichco_sp+="L ";
            if(int.parse(_sizeXL.text)>0)
              Them.kichco_sp+="XL ";
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => ThemSP()),);
          }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
        ],

      ),
      body:SingleChildScrollView(
      child:Column(
        children: [
        Container(
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
              children: [Text("S")],)),
            Expanded( flex: 2,
                child: Container(
                  child: TextFormField(
                    controller:_sizeS,
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
      ),
          ///M
          Container(
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
                  children: [Text("M")],)),
                Expanded( flex: 2,
                    child: Container(
                      child: TextFormField(
                        controller:_sizeM,
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
          ),
          ///L
          Container(
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
                  children: [Text("L")],)),
                Expanded( flex: 2,
                    child: Container(
                      child: TextFormField(
                        controller:_sizeL,
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
          ),
          ///XL
          Container(
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
                  children: [Text("XL")],)),
                Expanded( flex: 2,
                    child: Container(
                      child: TextFormField(
                        controller:_sizeXL,
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
          ),
        ],
      )
    ));
  }
}
