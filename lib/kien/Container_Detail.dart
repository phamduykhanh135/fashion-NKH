import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Item_Container extends StatefulWidget {
  const Item_Container({super.key});

  @override
  State<Item_Container> createState() => _Item_ContainerState();
}

class _Item_ContainerState extends State<Item_Container> {
  @override
  Widget build(BuildContext context) {
    return   SingleChildScrollView(
      child:  Container(
      
      child: Column(
        mainAxisSize: MainAxisSize.max,
        
        children: [
        
          const Text("Áo PHÔNG TRẮNG",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold),),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("\t Kích thước: "),
                    IconButton(onPressed: (){
                      _showHelpDialog(context);
                    }, icon: Icon(Icons.help_outline)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
    TextButton(
    style: ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey),  
    side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.black)),),
  onPressed: () {},
  child: Text("S", style: TextStyle(color: Colors.black)),),
    TextButton(
    style: ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey),  
    side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.black)),),
  onPressed: () {},
  child: Text("M", style: TextStyle(color: Colors.black)),),
    TextButton(
    style: ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey),  
    side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.black)),),
  onPressed: () {},
  child: Text("L", style: TextStyle(color: Colors.black)),),
    TextButton(
    style: ButtonStyle(
    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    overlayColor: MaterialStateColor.resolveWith((states) => Colors.grey),  
    side: MaterialStateBorderSide.resolveWith((states) => BorderSide(color: Colors.black)),),
  onPressed: () {},
  child: Text("XL", style: TextStyle(color: Colors.black)),), ], ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Mô tả sản phẩm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),
                  Divider(height: 10,),
                  Text(
                    "Chất liệu: 100% Catton Compact 2SC2\n" +
                        "- Thành phần: 100% Catton\n" + 
                        "- Thành phần: 100% Catton\n" +
                        "- Thành phần: 100% Catton\n" +
                        "- Thành phần: 100% Catton\n" +
                        "- Thành phần: 100% Catton\n"+
                        "- Thành phần: 100% Catton\n"+
                        "- Thành phần: 100% Catton\n"+
                        "- Thành phần: 100% Catton\n"+
                        "- Thành phần: 100% Catton\n"
                        "- mềm mại",style: TextStyle(fontSize: 18)
                  ),
                ],
              ),
            ),
              ],
            ),
            
          ),
          
        ],
      ),
    ),
    );
  }
}
void _showHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        
        content: Image.network(
          "https://cmsv2.yame.vn/uploads/96de2b6a-7cba-42ec-82ab-a80a62693726/size-chart-01.jpg", // Thay thế URL_CUA_ANH bằng đường link ảnh của bạn
          fit: BoxFit.contain,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Đóng dialog khi nhấn nút
            },
            child: Text("Đóng"),
          ),
        ],
      );
    },
  );
}