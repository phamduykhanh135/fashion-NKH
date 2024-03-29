import 'package:flutter/material.dart';
import 'package:sales_application/models/themsp.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/Hao/suasp_Screen.dart';
import 'package:sales_application/views/Hao/themsp_Screen.dart';

import '../../models/color.dart';
import '../../models/suasp.dart';

class GiaSP extends StatefulWidget {
  const GiaSP({super.key});

  @override
  State<GiaSP> createState() => _GiaSPState();
}
class _GiaSPState extends State<GiaSP> {
  final _giaban=TextEditingController();
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
              Navigator.pushReplacement( context,
                MaterialPageRoute(builder: (context) => const ThemSP()),);
            }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
          ],
           leading: IconButton(onPressed: (){
          Navigator.push( context,
            MaterialPageRoute(builder: (context) => const ThemSP()),);
        }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),

        ),
        body:   Container(
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
                children: [Text("Giá bán")],)),
              Expanded( flex: 2,
                  child: Container(
                    child: TextFormField(
                      controller:_giaban,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(8)],
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: 'Nhập giá .000',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
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
///==============================Sua
class SGiaSP extends StatelessWidget {
  SGiaSP(this.itemId, {Key? key}) : super(key: key) ;
  String itemId;
  final _giaban=TextEditingController(text: SuaMap.myMap['price'].toString().replaceAll(RegExp(r'\.0*$'), ''));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Giá bán",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          actions: [
            TextButton(onPressed: (){
              SuaMap.myMap['id']=itemId;
              int price=int.parse(_giaban.text);
              SuaMap.myMap['price']=price.toStringAsFixed(3);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SuaSP(SuaMap.myMap)));
            }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
          ],
          leading: IconButton(onPressed: (){
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => SuaSP(SuaMap.myMap)),);
          }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),

        ),
        body:   Container(
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
                children: [Text("Giá bán")],)),
              Expanded( flex: 2,
                  child: Container(
                    child: TextFormField(
                      controller:_giaban,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly
                      ,LengthLimitingTextInputFormatter(8)
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
