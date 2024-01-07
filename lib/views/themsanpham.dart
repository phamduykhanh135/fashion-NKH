import 'package:flutter/material.dart';

class ThemSP extends StatefulWidget {
  const ThemSP({super.key});

  @override
  State<ThemSP> createState() => _ThemSPState();
}

class _ThemSPState extends State<ThemSP> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Thêm sản phẩm",style: TextStyle(color: Color.fromRGBO(142, 28, 104, 1),fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(248, 163, 193, 1),

      ),
     body: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         Container(
           height: 140,
         padding:EdgeInsets.all(10),
         decoration:  BoxDecoration(
             color:  Color.fromRGBO(243, 243, 243, 1),
         ),
          child:Row(
            children: [
              InkWell(
                onTap: (){/*TODO:*/},
               child: Container(
                 height: 120,
                 width: 120,
                 decoration: BoxDecoration(
                   border: Border.all(
                     color: Colors.black,
                     width: 1,
                   ),
                 ),
                 child: Center(
                   child: Text("Thêm ảnh"),/*TODO:*/
                 ),
               ),

              ),

            ],

          )
         ),
       Container(
         height: 140,
         padding:EdgeInsets.all(10),
         constraints:BoxConstraints(maxHeight: 200.0),
         decoration:  BoxDecoration(
           color:  Color.fromRGBO(243, 243, 243, 1),
         ),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           mainAxisSize: MainAxisSize.max,
           children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text("Tên sản phẩm "),
                 Text("0/120")/*Todo:0/120*/
               ],
             ),
             TextField(
               controller: null/*Todo:*/,
               maxLines:3,
               decoration: InputDecoration(
                 hintText: 'Nhập tên sản phẩm',
                 border: InputBorder.none // Loại bỏ đường gạch chân khi không có focus
               ),
             )
           ],

         ),
       ),
         Container(
           height: 140,
           padding:EdgeInsets.all(10),
           constraints:BoxConstraints(maxHeight: 200.0),
           decoration:  BoxDecoration(
             color:  Color.fromRGBO(243, 243, 243, 1),
           ),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text("Mô tả sản phẩm "),
                   Text("0/3000")/*Todo:0/3000*/
                 ],
               ),
               TextField(
                 controller: null/*Todo:*/,
                 maxLines:3,
                 decoration: InputDecoration(
                     hintText: 'Nhập mô tả sản phẩm',
                     border: InputBorder.none // Loại bỏ đường gạch chân khi không có focus
                 ),
               )
             ],

           ),
         ),
         ///Phần chọn
     Container(
     height: 250,
     padding:EdgeInsets.all(10),
     decoration:  BoxDecoration(
       color:  Color.fromRGBO(243, 243, 243, 1),
     ),
       child:Column(
         children: [
           ///Loáip
           Expanded(

               child: InkWell(onTap: (){},
                  child: Row(
             children: [
               Expanded(child: Icon(Icons.category)), // Icon ở đầu
               Expanded(child: Text("Loại sản phẩm"),flex: 3,), // Khoảng trắng giữa hai icon
               Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
             ],
           ),)),
           ///Kich Co
           Expanded(

               child: InkWell(onTap: (){},
                 child: Row(
                   children: [
                     Expanded(child: Icon(Icons.format_size)), // Icon ở đầu
                     Expanded(child: Text("Kích cỡ"),flex: 3,), // Khoảng trắng giữa hai icon
                     Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                   ],
                 ),)),
           ///So luong
           Expanded(

               child: InkWell(onTap: (){},
                 child: Row(
                   children: [
                     Expanded(child: Icon(Icons.warehouse)), // Icon ở đầu
                     Expanded(child: Text("Số lượng kho"),flex: 3,), // Khoảng trắng giữa hai icon
                     Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                   ],
                 ),)),
           ///Gia
           Expanded(

               child: InkWell(onTap: (){},
                 child: Row(
                   children: [
                     Expanded(child: Icon(Icons.price_change)), // Icon ở đầu
                     Expanded(child: Text("Giá"),flex: 3,), // Khoảng trắng giữa hai icon
                     Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                   ],
                 ),)),
           ///Mua giam gia
           Expanded(

               child: InkWell(onTap: (){},
                 child: Row(
                   children: [
                     Expanded(child: Icon(Icons.percent)), // Icon ở đầu
                     Expanded(child: Text("Mua nhiều giảm giá"),flex: 3,), // Khoảng trắng giữa hai icon
                     Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                   ],
                 ),))
         ],
       ) ,
     ),
         ElevatedButton(
             onPressed: (){/*Todo:Luu thong tin*/},
             style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(Color.fromRGBO(248, 163, 193, 1)),
                 minimumSize: MaterialStateProperty.all(Size(150,50)),
               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                 RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0)
                  ,// Đặt bán kính bo tròn
                 ),
               ),
             ),
             child: Text("Lưu thông tin"))
       ],

     ),
    );
  }
}
