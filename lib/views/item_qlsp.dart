import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/suasanpham.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemSP extends StatelessWidget {
  ItemSP(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('products').doc(itemId);
    _futureData = _reference.get();
  }

  String itemId;
  late DocumentReference _reference;

  //_reference.get()  --> returns Future<DocumentSnapshot>
  //_reference.snapshots() --> Stream<DocumentSnapshot>
  late Future<DocumentSnapshot> _futureData;
  late Map data;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: _futureData,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            //Get the data
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;

            //display the data
            return Container(
              height: 280,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
              decoration: BoxDecoration(
                color: MyColor.light_grey,
                borderRadius: BorderRadius.circular(20.0),
                // boxShadow: [
                //   // BoxShadow(
                //   //   color: Colors.grey,
                //   //    offset: Offset(00.0, 1.0), // Độ lệch của bóng theo chiều dọc và ngang
                //   //   blurRadius: 1, // Độ mờ của bóng
                //   //   spreadRadius: 1.0, // Độ rộng của bóng
                //   // ),
                // ],
              ),
              child: Column(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: MyColor.dark_pink,
                            width: 1,

                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 3.0),
                              // Độ lệch của bóng theo chiều dọc và ngang
                              blurRadius: 3.0,
                              // Độ mờ của bóng
                              spreadRadius: 1.0, // Độ rộng của bóng
                            ),
                          ],
                        ),
                        height: double.maxFinite,
                        width: double.maxFinite,
                        child: SizedBox(
                          width: double.maxFinite, height: double.maxFinite,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            // Điều chỉnh góc bo tròn tại đây
                            child:
                            Image.network(
                              data['image'],
                              fit: BoxFit.cover,),
                          ),
                        ),
                      )
                      ),

                      Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data['name']}',
                                  softWrap: true,
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  maxLines: 3,),
                                RichText(
                                  text: TextSpan(
                                    text: null,
                                    style: DefaultTextStyle
                                        .of(context)
                                        .style,
                                    children: <TextSpan>[
                                      TextSpan(text: 'Giá: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,)),
                                      TextSpan(text: '${data['price']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.red,
                                            decoration: TextDecoration.none,)),
                                      TextSpan(text: 'đ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.red,
                                            decoration: TextDecoration.none,)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: null,
                                    style: DefaultTextStyle
                                        .of(context)
                                        .style,
                                    children: <TextSpan>[
                                      TextSpan(text: 'Số lượng: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,)),
                                      TextSpan(text: '${data['sizeS']+data['sizeM']+data['sizeL']+data['sizeXL']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            decoration: TextDecoration.none,)),
                                    ],
                                  ),
                                )
                              ],),
                          ))
                    ],
                  ), flex: 2),
                  Expanded(child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Expanded(
                          child: ElevatedButton(onPressed: () {}, child: Text(
                              "Xoá"))),
                      SizedBox(width: 30,),
                      Expanded(child: ElevatedButton(onPressed: () {
                        // truyen id
                        //data['id'] =itemId.toString();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuaSP(data)));
                        //Firebase gán class sửa
                      }, child: Text("Sửa"), style: ElevatedButton.styleFrom(
                        // Màu nền khi nút không được nhấn
                        onPrimary: MyColor.dark_pink,
                        foregroundColor: MyColor
                            .light_pink, // Màu chữ khi nút không được nhấn, // Màu nền khi nút được nhấn
                      ),)),
                      SizedBox(width: 10,),
                    ],
                  ), flex: 1,)
                ],
              ),
            );
          }


          return Center(child: CircularProgressIndicator());
        }
    );
  }
}
