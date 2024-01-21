  import 'package:flutter/material.dart';
  import '../../views/nghia/notification.dart';

  class Bottom_Nav extends StatelessWidget {
    const Bottom_Nav({super.key,required this.id});
    final id;
    @override
    Widget build(BuildContext context) {
      return  
      Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.pink.shade100, // Đặt màu nền là màu xanh
        ),
        child:
        BottomNavigationBar(
          // backgroundColor: Colors.blue,
          // fixedColor: Colors.blueAccent,
          
          items: const [
            BottomNavigationBarItem(
              label:"Trang chủ",
              icon: Icon(Icons.home,color: Colors.white,),
            ),
            BottomNavigationBarItem(
              label:"Thống kê",
              icon: Icon(Icons.bar_chart_sharp,color: Colors.white),
            ),
              BottomNavigationBarItem(
              label:"Thông báo",
              icon: Icon(Icons.notifications,color: Colors.white),
            ),
              BottomNavigationBarItem(
              label:"Thông tin cá nhân",
              icon: Icon(Icons.person,color: Colors.white),
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
            if(indexOfItem==3){
              Navigator.popUntil(context, (route) => route.isFirst);
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>const Personal_Screen()));
            Navigator.pushNamed(context,'/personal');
            }
          if(indexOfItem==2){
              Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Notifications()));
          // Navigator.pushNamed(context,'/statistical');
          }
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