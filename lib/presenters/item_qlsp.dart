import 'package:flutter/material.dart';
import 'package:sales_application/model/color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../views/Hao/suasp_Screen.dart';

class ItemSP extends StatelessWidget {
  ItemSP(this.itemId, {Key? key}) : super(key: key) {
    _reference = FirebaseFirestore.instance.collection('products').doc(itemId);
    _futureData = _reference.get();
  }
  String itemId;

  late DocumentReference _reference;
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
            DocumentSnapshot documentSnapshot = snapshot.data;
            data = documentSnapshot.data() as Map;
            return Container(
              height: 300,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
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
                  Expanded(flex: 2, child: Row(
                    children: [
                      Expanded(child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(
                            color: MyColor.dark_pink,
                            width: 1,

                          ),
                          boxShadow: const [
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
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data['name']}',
                                  softWrap: true,
                                  style: const TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                  maxLines: 3,),
                                RichText(
                                  text: TextSpan(
                                    text: null,
                                    style: DefaultTextStyle
                                        .of(context)
                                        .style,
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Giá: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,)),
                                      TextSpan(text: '${data['price']}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: int.parse(data['discount'])!=0?Colors.grey:Colors.red,
                                            decoration: int.parse(data['discount'])!=0?TextDecoration.lineThrough:TextDecoration.none)),
                                      TextSpan(text: 'đ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color:int.parse(data['discount'])!=0?Colors.grey:Colors.red,
                                            decoration: TextDecoration.none,)),
                                    ],
                                  ),
                                ),
                                //Giá sau giảm
                                if(int.parse(data['discount'])!=0)
                                RichText(
                                  text: TextSpan(
                                    text: null,
                                    style: DefaultTextStyle
                                        .of(context)
                                        .style,
                                    children: <TextSpan>[
                                      const TextSpan(text: 'Giảm: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,)),
                                      TextSpan(text: (int.parse(data['price'].replaceAll(RegExp(r'\.0*$'), '').toString())-int.parse(data['price'].replaceAll(RegExp(r'\.0*$'), '').toString())*int.parse(data['discount'])~/100).toStringAsFixed(3),
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: Colors.red,
                                            decoration: TextDecoration.none,)),
                                      const TextSpan(text: 'đ',
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
                                      const TextSpan(text: 'Số lượng: ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15,
                                            color: Colors.black,
                                            decoration: TextDecoration.none,)),
                                      TextSpan(text: '${int.parse(data['sizeS'])+int.parse(data['sizeM'])+int.parse(data['sizeL'])+int.parse(data['sizeXL'])}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            decoration: TextDecoration.none,)),
                                    ],
                                  ),
                                )
                              ],),
                          ))
                    ],
                  )),
                  Expanded(flex: 1,child: Row(
                    children: [
                      const SizedBox(width: 10,),
                      Expanded(
                          child: ElevatedButton(onPressed: () async{
                            bool result = await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return _showDialog(context);
                              },
                            );
                            if (result) {
                              _reference.delete();
                            } else {
                              print('Người dùng đã chọn "No" hoặc đóng dialog');
                            }
                          }, child: const Text(
                              "Xoá"))),
                      const SizedBox(width: 30,),
                      Expanded(child: ElevatedButton(onPressed: () {
                        // truyen id
                        data['id'] =itemId;
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SuaSP(data)));
                        //Firebase gán class sửa
                      }, style: ElevatedButton.styleFrom(
                        // Màu nền khi nút không được nhấn
                        foregroundColor: MyColor
                            .light_pink, // Màu chữ khi nút không được nhấn, // Màu nền khi nút được nhấn
                      ), child: const Text("Sửa"),)),
                      const SizedBox(width: 10,),
                    ],
                  ),)
                ],
              ),
            );
          }


          return const Center(child: CircularProgressIndicator());
        }
    );
  }
  @override
  Widget _showDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Xác nhận',style: TextStyle(color: MyColor.dark_pink,fontWeight: FontWeight.bold)),
      content: Text('Bạn có muốn xoá sản phẩm này?',style: TextStyle(color: MyColor.dark_pink)),
      backgroundColor: Colors.white,
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            // Màu nền của nút
          ),
          onPressed: () {
            // Đóng dialog và không thực hiện hành động gì
            Navigator.of(context).pop(false);
          },
          child: Text('No',style: TextStyle(color: MyColor.dark_pink),),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            // Màu nền của nút
            foregroundColor: Colors.white, backgroundColor: MyColor.light_pink
          ),
          onPressed: () {
            // Thực hiện hành động khi người dùng chọn "Yes"
            Navigator.of(context).pop(true);
          },
          child: const Text('Yes'),
        ),
      ],
    );
  }
}
