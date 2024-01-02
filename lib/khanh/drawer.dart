import 'package:flutter/material.dart';
import 'package:sales_application/khanh/produc_magement.dart';

class Drawer_Menu extends StatefulWidget {
  const Drawer_Menu({super.key});

  @override
  State<Drawer_Menu> createState() => _Drawer_MenuState();
}

class _Drawer_MenuState extends State<Drawer_Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("Menu",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold),),
              ],
            )
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Trang chủ"),
                onTap: (){},
            ),
            ListTile(
                leading: const Icon(Icons.list),
                title: const Text("Danh sách"),
                onTap: (){},
            ),
            ListTile(
                leading: const Icon(Icons.local_mall_rounded),
                title: const Text("Quản lý sản phẩm"),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const Product_Management()));
                },
            )
        ],
      ),
    );
  }
}