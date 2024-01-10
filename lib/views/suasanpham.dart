import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/gia_sp.dart';
import 'package:sales_application/views/giamgia.dart';
import 'package:sales_application/views/loaisanpham.dart';
import 'package:sales_application/views/soluongkho.dart';
class SuaSP extends StatefulWidget {
  const SuaSP({super.key});

  @override
  State<SuaSP> createState() => _SuaSPState();
}

class _SuaSPState extends State<SuaSP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        title:  Text("Sửa sản phẩm",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor:  MyColor.light_pink,
        actions: [
          TextButton(onPressed: (){}, child: Text("Lưu",style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold,fontSize: 17)))
        ],


      ),
      body:
          SingleChildScrollView(
      child:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/60),
          Container(
              height: 140,
              padding:const EdgeInsets.all(10),
              decoration:   BoxDecoration(
                color:  MyColor.light_grey,
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        child:InkWell(
                          onTap: (){/*TODO:*/},
                          child: Center(
                            child: Text("Thêm ảnh"),/*TODO:*/
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: IconButton(
                          icon: Icon(Icons.close_rounded),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )

                ],

              )
          ),
          SizedBox(height: MediaQuery.of(context).size.height/60),
          Container(
            height: 120,
            padding:EdgeInsets.all(10),
            constraints:BoxConstraints(maxHeight: 200.0),
            decoration:  BoxDecoration(
              color:  MyColor.light_grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: null,
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: 'Tên sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13,color: Colors.black,decoration: TextDecoration.none,)),
                          TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.red,decoration: TextDecoration.none,)),
                        ],
                      ),
                    ),
                    Text("0/120")/*Todo:0/120*/
                  ],
                ),
                TextField(
                  controller: null/*Todo:*/,
                  maxLines:2,
                  decoration: InputDecoration(
                      hintText: 'Nhập tên sản phẩm',
                      border: InputBorder.none // Loại bỏ đường gạch chân khi không có focus
                  ),
                )
              ],

            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/60),
          Container(
            height: 120,
            padding:EdgeInsets.all(10),
            constraints:BoxConstraints(maxHeight: 200.0),
            decoration:  BoxDecoration(
              color:  MyColor.light_grey,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: null,
                        style: DefaultTextStyle.of(context).style,
                        children: <TextSpan>[
                          TextSpan(text: 'Mô tả sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13,color: Colors.black,decoration: TextDecoration.none,)),
                          TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.red,decoration: TextDecoration.none,)),
                        ],
                      ),
                    ),
                    Text("0/3000")/*Todo:0/3000*/
                  ],
                ),
                TextField(
                  controller: null/*Todo:*/,
                  maxLines:2,
                  decoration: InputDecoration(
                      hintText: 'Nhập mô tả sản phẩm',
                      border: InputBorder.none // Loại bỏ đường gạch chân khi không có focus
                  ),
                )
              ],

            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height/60),
          ///Phần chọn
          Container(
            height: 250,
            padding:EdgeInsets.all(10),
            decoration:  BoxDecoration(
              color:  MyColor.light_grey,
            ),
            child:Column(
              children: [
                ///Loáip
                Expanded(

                    child: InkWell(onTap: (){
                      Navigator.push( context,
                        MaterialPageRoute(builder: (context) => LoaiSP()),);
                    },
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.category)), // Icon ở đầu
                          Expanded(child: RichText(
                            text: TextSpan(
                              text: null,
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Loại sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                                TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                              ],
                            ),
                          ),flex: 3,), // Khoảng trắng giữa hai icon
                          Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                        ],
                      ),)),

                ///So luong
                Expanded(

                    child: InkWell(onTap: (){
                      Navigator.push( context,
                        MaterialPageRoute(builder: (context) => SoLuongKho()),);
                    },
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.warehouse)), // Icon ở đầu
                          Expanded(child: RichText(
                            text: TextSpan(
                              text: null,
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Số lượng kho ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                                TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                              ],
                            ),
                          ),flex: 3,), // Khoảng trắng giữa hai icon
                          Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                        ],
                      ),)),
                ///Kich Co
                Expanded(

                    child: InkWell(onTap: (){},
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.format_size)), // Icon ở đầu
                          Expanded(child: Text("Kích cỡ",style: TextStyle(fontSize: 14)),flex: 3,), // Khoảng trắng giữa hai icon
                          Expanded(child: Text("S,M,L,XL")),  // Icon ở cuối
                        ],
                      ),)),
                ///Gia
                Expanded(

                    child: InkWell(onTap: (){
                      Navigator.push( context,
                        MaterialPageRoute(builder: (context) => GiaSP()),);
                    },
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.price_change)), // Icon ở đầu
                          Expanded(child: RichText(
                            text: TextSpan(
                              text: null,
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(text: 'Giá bán ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                                TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                              ],
                            ),
                          ),flex: 3,), // Khoảng trắng giữa hai icon
                          Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                        ],
                      ),)),
                ///Mua giam gia
                Expanded(

                    child: InkWell(onTap: (){
                      Navigator.push( context,
                        MaterialPageRoute(builder: (context) => GiamGia()),);
                    },
                      child: Row(
                        children: [
                          Expanded(child: Icon(Icons.percent)), // Icon ở đầu
                          Expanded(child: Text("Giảm giá",style: TextStyle(fontSize: 14),),flex: 3,), // Khoảng trắng giữa hai icon
                          Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                        ],
                      ),))
              ],
            ) ,
          ),

        ],

      ),
    ));
  }
}
