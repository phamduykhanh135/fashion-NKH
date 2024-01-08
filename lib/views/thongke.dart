import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/pie_chart.dart';

class ThongKe extends StatefulWidget {
  const ThongKe({super.key});

  @override
  State<ThongKe> createState() => _ThongKeState();
}

class _ThongKeState extends State<ThongKe> {
  bool FirstButton = true;
  bool SecondButton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thống kê",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,

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
                            return MyColor.light_pink; // Màu nền khi nút 1 được chọn
                          }
                          return MyColor.light_grey; // Màu nền khi nút 1 không được chọn
                        },
                      ),
                      minimumSize: MaterialStateProperty.all(Size(125,60)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái trên
                            bottomLeft: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái dưới
                          ),
                          side: BorderSide(width: 1.0,color: MyColor.dark_pink ),

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
                            return MyColor.light_pink; // Màu nền khi nút 1 được chọn
                          }
                          return MyColor.light_grey; // Màu nền khi nút 1 không được chọn
                        },
                      ),
                      minimumSize: MaterialStateProperty.all(Size(125,60)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái trên
                            bottomRight: Radius.circular(20.0),  // Bán kính bo tròn ở góc trái dưới
                          ),
                          side: BorderSide(width: 1.0,color: MyColor.dark_pink ),

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
              color:  MyColor.light_grey,
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
    color:  MyColor.light_grey,
    borderRadius: BorderRadius.circular(20.0)
    ),

                child: Row(
                  children: [
                   Expanded(child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Week 1")
                     ],
                   )),
                    Expanded(
                    flex: 4,child: Column(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("10")
                          ],
                        )),
                        Expanded(flex:2,child:
                        SliderTheme(
                          data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                            trackHeight: 8.0,
                              disabledActiveTrackColor:MyColor.color_w1
                          ),
                          child: Slider(
                            value:50 ,
                            onChanged: null,
                            min: 0,
                            max: 100,
                          ),
                        )
                        )
                      ],
                    ))
                  ],

          ),)
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height: 40,
                width: 324,
                decoration:  BoxDecoration(
                    color:  MyColor.light_grey,
                    borderRadius: BorderRadius.circular(20.0)
                ),

                child: Row(
                  children: [
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Week 2")
                      ],
                    )),
                    Expanded(
                        flex: 4,child: Column(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("10")
                          ],
                        )),
                        Expanded(flex:2,child:
                        SliderTheme(
                          data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                            trackHeight: 8.0,
                              disabledActiveTrackColor:MyColor.color_w2),
                          child: Slider(

                            value:50 ,
                            onChanged: null,
                            min: 0,
                            max: 100,
                          ),
                        )
                        )
                      ],
                    ))
                  ],

                ),)
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height: 40,
                width: 324,
                decoration:  BoxDecoration(
                    color:  MyColor.light_grey,
                    borderRadius: BorderRadius.circular(20.0)
                ),

                child: Row(
                  children: [
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Week 3")
                      ],
                    )),
                    Expanded(
                        flex: 4,child: Column(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("10")
                          ],
                        )),
                        Expanded(flex:2,child:
                        SliderTheme(
                          data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                            trackHeight: 8.0,
                              disabledActiveTrackColor:MyColor.color_w3),
                          child: Slider(

                            value:50 ,
                            onChanged: null,
                            min: 0,
                            max: 100,
                          ),
                        )
                        )
                      ],
                    ))
                  ],

                ),)
          ),
          SizedBox(height: 10),
          Expanded(
              child: Container(
                height: 40,
                width: 324,
                decoration:  BoxDecoration(
                    color:  MyColor.light_grey,
                    borderRadius: BorderRadius.circular(20.0)
                ),

                child: Row(
                  children: [
                    Expanded(child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Week 4")
                      ],
                    )),
                    Expanded(
                        flex: 4,child: Column(
                      children: [
                        Expanded(child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("10")
                          ],
                        )),
                        Expanded(flex:2,child:
                        SliderTheme(
                          data: SliderThemeData(
                            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 0.0),
                            trackHeight: 8.0,
                              disabledActiveTrackColor:MyColor.color_w4),
                          child: Slider(
                            value:70 ,
                            onChanged: null,
                            min: 0,
                            max: 100,
                          ),
                        )
                        )
                      ],
                    ))
                  ],

                ),)
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
