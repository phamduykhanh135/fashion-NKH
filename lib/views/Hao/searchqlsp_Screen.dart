import 'package:sales_application/model/searchsp.dart';
import 'package:flutter/material.dart';
import 'package:sales_application/model/color.dart';
import 'package:sales_application/views/Hao/qlsp_Screen.dart';
class SearchPage extends StatefulWidget {
   SearchPage( {Key? key}) : super(key: key);
  // final List<Map<String, dynamic>> items;
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _search=TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColor.light_pink,
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color:Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: TextField(
                controller: _search,
                  onChanged: (value) {
                    setState(() {
                      // SearchSP.found = widget.items
                      //     .where((product) =>
                      //     product['name'].toLowerCase().contains(value.toLowerCase()))
                      //     .toList();
                    });
                  },
                decoration: InputDecoration(

                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        Navigator.pop( context,
                          MaterialPageRoute(builder: (context) => QuanLySP()),);
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _search.clear();
                      },
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none,
                    ),
              ),
            ),
          ),
          leading:IconButton(onPressed: (){
            Navigator.of(context).pop(MaterialPageRoute(
                builder: (context) => QuanLySP()));
          }, icon:Icon(Icons.arrow_back,color: MyColor.dark_pink))),
    );

  }

  }
