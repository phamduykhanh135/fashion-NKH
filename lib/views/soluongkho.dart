import 'package:flutter/material.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/color.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/suasanpham.dart';
import 'package:sales_application/views/themsanpham.dart';

import '../model/suasp.dart';

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
        leading: IconButton(onPressed: (){
          Navigator.push( context,
            MaterialPageRoute(builder: (context) => ThemSP()),);
        }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),

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
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly
                      ,LengthLimitingTextInputFormatter(10)
                    ],
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
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly ,LengthLimitingTextInputFormatter(10)],
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
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly ,LengthLimitingTextInputFormatter(10)],
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
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly ,LengthLimitingTextInputFormatter(10)],
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
///=======================================
class SSoLuongKho extends StatelessWidget {
  SSoLuongKho(this.itemId, {Key? key}) : super(key: key);
  String itemId;
  var _sizeS=TextEditingController(text: SuaMap.myMap['sizeS'].toString());
  var _sizeM=TextEditingController(text: SuaMap.myMap['sizeM'].toString());
  var _sizeL=TextEditingController(text: SuaMap.myMap['sizeL'].toString());
  var _sizeXL=TextEditingController(text: SuaMap.myMap['sizeXL'].toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Số lượng",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          actions: [
            TextButton(onPressed: (){
              SuaMap.myMap['sizeS']=int.parse(_sizeS.text);
              SuaMap.myMap['sizeM']=int.parse(_sizeM.text);
              SuaMap.myMap['sizeL']=int.parse(_sizeL.text);
              SuaMap.myMap['sizeXL']=int.parse(_sizeXL.text);
              SuaMap.myMap['id']=itemId;
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SuaSP(SuaMap.myMap)));
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
