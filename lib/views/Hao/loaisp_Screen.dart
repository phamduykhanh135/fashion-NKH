import 'package:flutter/material.dart';
import 'package:sales_application/model/suasp.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/model/color.dart';
import 'package:sales_application/views/Hao/suasp_Screen.dart';
import 'package:sales_application/views/Hao/themsp_Screen.dart';

class LoaiSP extends StatefulWidget {
  const LoaiSP({super.key});

  @override
  State<LoaiSP> createState() => _LoaiSPState();
}

class _LoaiSPState extends State<LoaiSP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loại sản phẩm",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        leading: IconButton(onPressed: (){
          Navigator.pop(   context,
            MaterialPageRoute(builder: (context) => const ThemSP()),);
        }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            ///Quần
            Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColor.light_grey,
                  width: 1.5,
                ),
              ),
            ),

            child: InkWell(
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const ThemSP()),);
                  Them.l_sp="Quần";
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(35,0, 0,0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text("Quần")),
                      Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )
            )
        ),
        ///Áo
        Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColor.light_grey,
                  width: 1.5,
                ),
              ),
            ),

            child: InkWell(
                onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const ThemSP()),);
                  Them.l_sp="Áo";
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(35,0, 0,0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text("Áo")),
                      Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )
            )
        ),
        ///Phụ kiện
        Container(
            height: 65,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: MyColor.light_grey,
                  width: 1.5,
                ),
              ),
            ),

            child: InkWell(
                onTap: (){
                  Navigator.pop( context,
                    MaterialPageRoute(builder: (context) => const ThemSP()),);
                  Them.l_sp="Phụ kiện";
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(35,0, 0,0),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(flex: 3, child: Text("Phụ kiện")),
                      Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                    ],
                  ),
                )
            )
        ),
          ],
        ),
      )
    );
  }
}
///======================================Sua======================
class SuaLoaiSP extends StatelessWidget {
  SuaLoaiSP(this.itemId, {Key? key}) : super(key: key) ;
  String itemId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Loại sản phẩm",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          leading: IconButton(onPressed: (){
            SuaMap.myMap['id']=itemId;
            Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) => SuaSP(SuaMap.myMap)));
          }, icon: Icon(Icons.arrow_back,color: MyColor.dark_pink)),      ),
        body:  SingleChildScrollView(
          child: Column(
            children: [
              ///Quần
              Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: MyColor.light_grey,
                        width: 1.5,
                      ),
                    ),
                  ),

                  child: InkWell(
                      onTap: (){
                        SuaMap.myMap["category"]="Quần";
                        SuaMap.myMap['id']=itemId;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuaSP(SuaMap.myMap)));

                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(35,0, 0,0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3, child: Text("Quần")),
                            Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                          ],
                        ),
                      )
                  )
              ),
              ///Áo
              Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: MyColor.light_grey,
                        width: 1.5,
                      ),
                    ),
                  ),

                  child: InkWell(
                      onTap: (){
                        SuaMap.myMap["category"]="Áo";
                        SuaMap.myMap['id']=itemId;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuaSP(SuaMap.myMap)));

                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(35,0, 0,0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3, child: Text("Áo")),
                            Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                          ],
                        ),
                      )
                  )
              ),
              ///Phụ kiện
              Container(
                  height: 65,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: MyColor.light_grey,
                        width: 1.5,
                      ),
                    ),
                  ),

                  child: InkWell(
                      onTap: (){
                        SuaMap.myMap["category"]="Phụ kiện";
                        SuaMap.myMap['id']=itemId;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuaSP(SuaMap.myMap)));

                      },
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(35,0, 0,0),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 3, child: Text("Phụ kiện")),
                            Expanded(child: Icon(Icons.arrow_forward_ios_outlined))
                          ],
                        ),
                      )
                  )
              ),
            ],
          ),
        )
    );
  }
}