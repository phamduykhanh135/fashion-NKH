import 'package:flutter/material.dart';
import 'package:sales_application/models/themsp.dart';
import 'package:sales_application/models/color.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/views/Hao/suasp_Screen.dart';
import 'package:sales_application/views/Hao/themsp_Screen.dart';

import '../../models/suasp.dart';

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
  void initState() {
    super.initState();
     _sizeS=TextEditingController(text:Them.quatitySizeS.toString());
     _sizeM=TextEditingController(text: Them.quatitySizeM.toString());
    _sizeL=TextEditingController(text: Them.quatitySizeL.toString());
    _sizeXL=TextEditingController(text:Them.quatitySizeXL.toString());
  }
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
            Navigator.pushReplacement( context,
              MaterialPageRoute(builder: (context) => const ThemSP()),);
          }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
        ],
        leading: IconButton(onPressed: (){
          Navigator.pushReplacement( context,
            MaterialPageRoute(builder: (context) => const ThemSP()),);
        }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),

      ),
      body:SingleChildScrollView(
      child:Column(
        children: [
        Container(
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
      ),
          ///M
          Container(
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
                  children: [Text("M")],)),
                Expanded( flex: 2,
                    child: Container(
                      child: TextFormField(
                        controller:_sizeM,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly ,LengthLimitingTextInputFormatter(10)],
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
          ),
          ///L
          Container(
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
                  children: [Text("L")],)),
                Expanded( flex: 2,
                    child: Container(
                      child: TextFormField(
                        controller:_sizeL,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly ,LengthLimitingTextInputFormatter(10)],
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
          ),
          ///XL
          Container(
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
                  children: [Text("XL")],)),
                Expanded( flex: 2,
                    child: Container(
                      child: TextFormField(
                        controller:_sizeXL,
                        keyboardType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly ,LengthLimitingTextInputFormatter(10)],
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
  final _sizeS=TextEditingController(text: SuaMap.myMap['sizeS'].toString());
  final _sizeM=TextEditingController(text: SuaMap.myMap['sizeM'].toString());
  final _sizeL=TextEditingController(text: SuaMap.myMap['sizeL'].toString());
  final _sizeXL=TextEditingController(text: SuaMap.myMap['sizeXL'].toString());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Số lượng",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          actions: [
            TextButton(onPressed: (){
              SuaMap.myMap['sizeS']=_sizeS.text;
              SuaMap.myMap['sizeM']=_sizeM.text;
              SuaMap.myMap['sizeL']=_sizeL.text;
              SuaMap.myMap['sizeXL']=_sizeXL.text;
              SuaMap.myMap['id']=itemId;
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SuaSP(SuaMap.myMap)));
            }, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)))
          ],
            leading:IconButton(onPressed: (){
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => SuaSP(SuaMap.myMap)));
            }, icon:Icon(Icons.arrow_back,color: MyColor.dark_pink))

        ),
        body:SingleChildScrollView(
            child:Column(
              children: [
                Container(
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
                        children: [Text("S")],)),
                      Expanded( flex: 2,
                          child: Container(
                            child: TextFormField(
                              controller:_sizeS,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
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
                ),
                ///M
                Container(
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
                        children: [Text("M")],)),
                      Expanded( flex: 2,
                          child: Container(
                            child: TextFormField(
                              controller:_sizeM,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
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
                ),
                ///L
                Container(
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
                        children: [Text("L")],)),
                      Expanded( flex: 2,
                          child: Container(
                            child: TextFormField(
                              controller:_sizeL,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
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
                ),
                ///XL
                Container(
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
                        children: [Text("XL")],)),
                      Expanded( flex: 2,
                          child: Container(
                            child: TextFormField(
                              controller:_sizeXL,
                              keyboardType: TextInputType.number,
                              inputFormatters: [FilteringTextInputFormatter.digitsOnly,LengthLimitingTextInputFormatter(10)],
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
                ),
              ],
            )
        ));
  }
}