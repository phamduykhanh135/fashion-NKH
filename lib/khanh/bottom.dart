  import 'package:flutter/material.dart';

  class Bottom_Nav extends StatelessWidget {
    const Bottom_Nav({super.key,required this.id});
    final id;
    @override
    Widget build(BuildContext context) {
      return   Container(
       color: Colors.blue,
        child: BottomNavigationBar(
          backgroundColor: Colors.blue,
          fixedColor: Colors.blueAccent,
          
          items: const [
            BottomNavigationBarItem(
              label:"Trang chủ",
              icon: Icon(Icons.home,color: Colors.black,),
            ),
            BottomNavigationBarItem(
              label:"Thông tin cá nhân",
              icon: Icon(Icons.account_circle_rounded,color: Colors.black),
            ),
              BottomNavigationBarItem(
              label:"Thông tin thống kê",
              icon: Icon(Icons.bar_chart_outlined,color: Colors.black),
            ),
              BottomNavigationBarItem(
              label:"Danh sách đơn hàng",
              icon: Icon(Icons.list_alt_sharp,color: Colors.black),
            ),
            //Statistical_Page
          ],
          currentIndex: id,
          onTap: (int indexOfItem){
            if(indexOfItem==0)
            {
            Navigator.popUntil(context, (route) => route.isFirst);
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home_Page()));
            Navigator.pushNamed(context,'/menu');
            } 
            if(indexOfItem==1){
              Navigator.popUntil(context, (route) => route.isFirst);
            //Navigator.push(context, MaterialPageRoute(builder: (context)=>const Personal_Page()));
            Navigator.pushNamed(context,'/personal');
            }
            // if(indexOfItem==2){
            //    Navigator.popUntil(context, (route) => route.isFirst);
            // //Navigator.push(context, MaterialPageRoute(builder: (context)=>const Personal_Page()));
            // Navigator.pushNamed(context,'/statistical');
            // }
            // if(indexOfItem==3){
            //    Navigator.popUntil(context, (route) => route.isFirst);
            // //Navigator.push(context, MaterialPageRoute(builder: (context)=>const Personal_Page()));
            // Navigator.pushNamed(context,'/list');
            // }
          },
          ),
      );
    }
  }