import 'package:flutter/material.dart';
import 'package:sales_application/views/pie_chart.dart';

class ThongKe extends StatefulWidget {
  const ThongKe({super.key});

  @override
  State<ThongKe> createState() => _ThongKeState();
}

class _ThongKeState extends State<ThongKe> {
  bool FirstButton = false;
  bool SecondButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thống kê",style: TextStyle(color: Color.fromRGBO(142, 28, 104, 1),fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(248, 163, 193, 1),

      ),
      body: Column(
        children: [
          //BUTTON
          Expanded(
              child:Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center ,
                children: [
                  ElevatedButton(
                    autofocus: true,
                      onPressed: (){
                        {
                          FirstButton?null:{
                            setState(() {
                              FirstButton = true;
                              SecondButton = false;
                            })
                          };
                        }
                      }
                      , child: Text("Đơn hàng"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (FirstButton) {
                            return Color.fromRGBO(248, 163, 193, 1); // Màu nền khi nút 1 được chọn
                          }
                          return Color.fromRGBO(243, 243, 243, 1); // Màu nền khi nút 1 không được chọn
                        },
                      ),
                      minimumSize: MaterialStateProperty.all(Size(125,60)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái trên
                            bottomLeft: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái dưới
                          ),
                          side: BorderSide(width: 1.0,color: Color.fromRGBO(142, 28, 104, 1) ),

                    ),
                  ),
                    ),

                  ),
                  ElevatedButton(
                      onPressed: (){
                        SecondButton?null:{
                          setState(() {
                            FirstButton = false;
                            SecondButton = true;
                          })
                        };
                      },
                    child: Text("Chi tiêu"),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (SecondButton) {
                            return Color.fromRGBO(248, 163, 193, 1); // Màu nền khi nút 1 được chọn
                          }
                          return Color.fromRGBO(243, 243, 243, 1); // Màu nền khi nút 1 không được chọn
                        },
                      ),
                      minimumSize: MaterialStateProperty.all(Size(125,60)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái trên
                            bottomRight: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái dưới
                          ),
                          side: BorderSide(width: 1.0,color: Color.fromRGBO(142, 28, 104, 1) ),

                        ),
                      ),
                    ),

                  )
                ],
              )
          
          ),
          //CHART
          Expanded(
            flex: 3,
              child: Container(
            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: 300
              ,width: 320,
            child:  MyPieChart(10,10,10,10),
            decoration:  BoxDecoration(
              color:  Color.fromRGBO(243, 243, 243, 1),
              borderRadius: BorderRadius.circular(20.0)
          )
              )
          ),
          //TEXT
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height: 40,
                width: 324,
        decoration:  BoxDecoration(
    color:  Color.fromRGBO(243, 243, 243, 1),
    borderRadius: BorderRadius.circular(20.0)
    ),

                child: Row(
                  children: [
                    Text("Week 1"),
                    Column(
                      children: [
                        Text("10"),     //Thanh nang luong
                      // SizedBox(
                      //   height: 5,
                      //   child:   LinearProgressIndicator(
                      //       backgroundColor: Color.fromRGBO(243, 243, 243, 1),
                      //       valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      //       value: 0.5
                      //   ),
                      //)
                      ],
                    )
                  ],

          ),)
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height: 40,
                width: 324,
                decoration:  BoxDecoration(
                    color:  Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  children: [
                    Text("Week 2"),
                    Column(
                      children: [
                        Text("10"),
                        //Thanh nang luong
                      ],
                    )
                  ],

                ),)
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height: 40,
                width: 324,
                decoration:  BoxDecoration(
                    color:  Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  children: [
                    Text("Week 3"),
                    Column(
                      children: [
                        Text("10"),
                        //Thanh nang luong
                      ],
                    )
                  ],

                ),)
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height:40,
                width: 324,
                padding: EdgeInsets.all(5),
                decoration:  BoxDecoration(
                    color:  Color.fromRGBO(243, 243, 243, 1),
                    borderRadius: BorderRadius.circular(20.0)
                ),
                child: Row(
                  children: [
                    Text("Week 4"),
                    Column(
                      children: [
                        Text("10"),
                        //Thanh nang luong
                      ],
                    )
                  ],

                ),)
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
