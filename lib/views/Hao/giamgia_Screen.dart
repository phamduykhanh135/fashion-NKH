import 'package:flutter/material.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/model/color.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/Hao/suasp_Screen.dart';
import 'package:sales_application/views/Hao/themsp_Screen.dart';

import '../../model/suasp.dart';
class GiamGia extends StatefulWidget {
  const GiamGia({super.key});

  @override
  State<GiamGia> createState() => _GiamGiaState();
}

class _GiamGiaState extends State<GiamGia> {
  final _giamgia=TextEditingController();
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
            Navigator.pop( context,
              MaterialPageRoute(builder: (context) => const ThemSP()),);
          }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
        ],
        leading: IconButton(onPressed: (){
          Navigator.pop( context,
            MaterialPageRoute(builder: (context) => const ThemSP()),);
        }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),

      ),
      body:  Container(
        height: 130,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        decoration:  BoxDecoration(
            color:  MyColor.light_grey,
            borderRadius: BorderRadius.circular(30.0)
        ),
        child: Row(
          children: [
            const Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text("Giảm giá")],)),
            Expanded( flex: 2,
                child: Container(
                  child: TextFormField(

                    controller:_giamgia,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3)
                    ],
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: 'Enter number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(color: Colors.grey, width: 2.0),
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
///========================================
class SGiamGia extends StatelessWidget {
    SGiamGia(this.itemId, {Key? key}) : super(key: key);
    String itemId;
  final _giamgia=TextEditingController(text: SuaMap.myMap['discount'].toString());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giảm giá",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          actions: [
            TextButton(onPressed: (){
              SuaMap.myMap['id']=itemId;
              SuaMap.myMap['discount']=_giamgia.text;
              Navigator.of(context).pop(MaterialPageRoute(
                  builder: (context) => SuaSP(SuaMap.myMap)));
            }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
          ],
            leading:IconButton(onPressed: (){
              Navigator.of(context).pop(MaterialPageRoute(
                  builder: (context) => SuaSP(SuaMap.myMap)));
            }, icon:Icon(Icons.arrow_back,color: MyColor.dark_pink))

        ),
        body:  Container(
          height: 130,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          decoration:  BoxDecoration(
              color:  MyColor.light_grey,
              borderRadius: BorderRadius.circular(30.0)
          ),
          child: Row(
            children: [
              const Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Giảm giá")],)),
              Expanded( flex: 2,
                  child: Container(
                    child: TextFormField(

                      controller:_giamgia,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3)],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Enter number',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
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
