import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/model/color.dart';
import 'package:sales_application/views/Hao/qlsp_Screen.dart';
import 'package:sales_application/views/Hao/slkho_Screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'giamgia_Screen.dart';
import 'giasp_Screen.dart';
import 'loaisp_Screen.dart';
class ThemSP extends StatefulWidget {
  const ThemSP({super.key});

  @override
  State<ThemSP> createState() => _ThemSPState();
}

class _ThemSPState extends State<ThemSP> {
  //Firebase
  final CollectionReference _reference=FirebaseFirestore.instance.collection('products');
  //Khai báo
  GlobalKey<FormState> key=GlobalKey();
  String? _selected;
  TextEditingController _tensp = TextEditingController();
  TextEditingController _mota = TextEditingController();
  final String _loai_sp= Them.l_sp;
  String _kichco_sp=Them.kichco_sp;
  final int _soLuongKho=Them.quatitySizeL+Them.quatitySizeM+Them.quatitySizeS+Them.quatitySizeXL;
  final int _giaBan=Them.price_sp;
  final int _giamGia=Them.discount_sp;
  String imageUrl='';
  @override
  void initState() {
    super.initState();
    _tensp = TextEditingController(text: Them.ten_sp);
    _mota= TextEditingController(text:Them.mota_sp);
    _selected=Them.linkImage;
    if(Them.quatitySizeS>0) {
      _kichco_sp+="S ";
    }
    if(Them.quatitySizeM>0) {
      _kichco_sp+="M ";
    }
    if(Them.quatitySizeL>0) {
      _kichco_sp+="L ";
    }
    if(Them.quatitySizeXL>0) {
      _kichco_sp+="XL ";
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text("Thêm sản phẩm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: MyColor.light_pink,
      actions: [
        TextButton(onPressed: (

        ) async {
          //Cap nhat gia tri sp của class

            Them.ten_sp=_tensp.text;
            Them.mota_sp=_mota.text;
            //Create a Map of data
            Map<String,dynamic> dataToSend={
              'id':"",
              'descriptions':Them.mota_sp,
              'category':Them.l_sp,
              'discount':Them.discount_sp.toString(),
              'image':Them.linkImage,
              'name':Them.ten_sp,
              'price':Them.price_sp.toStringAsFixed(3).toString(),
              'sizeS':Them.quatitySizeS.toString(),
              'sizeM':Them.quatitySizeM.toString(),
              'sizeL':Them.quatitySizeL.toString(),
              'sizeXL':Them.quatitySizeXL.toString(),
              'status':true
            };

            //Add a new item



          if(_tensp.text==""||_mota.text==""||_loai_sp==""||_giaBan==0||_soLuongKho==0||_selected==""){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Bạn chưa nhập đầy đủ thông tin'),
              ),
            );
          }
          else{
            try {
              DocumentReference newDocumentRef= await _reference.add(dataToSend);
              String autoId=newDocumentRef.id;
              await newDocumentRef.update({'id':autoId});
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Thêm sản phẩm thành công'),
                ),
              );
            }catch(e){
              print(e);
            }
            Them.linkImage="";
            Them.kichco_sp="";
            Them.ten_sp="";
            Them.mota_sp="";
            Them.l_sp="";
            Them.price_sp=0;
            Them.quatitySizeS=0;
            Them.quatitySizeM=0;
            Them.quatitySizeL=0;
            Them.quatitySizeXL=0;
            Them.discount_sp=0;
            Them.char_ten=0;
            Them.char_mota=0;
            _selected="";
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => QuanLySP()),);
          }
          //Firebase
          //Final

        }, child: const Text("Lưu",style: TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 17)))
      ],
      leading: IconButton(
        onPressed: (){
        Them.linkImage="";
        Them.kichco_sp="";
        Them.ten_sp="";
        Them.mota_sp="";
        Them.l_sp="";
        Them.price_sp=0;
        Them.quatitySizeS=0;
        Them.quatitySizeM=0;
        Them.quatitySizeL=0;
        Them.quatitySizeXL=0;
        Them.discount_sp=0;
        Them.char_ten=0;
        Them.char_mota=0;
        _selected="";
        Navigator.pop(context);
        // Navigator.pop (context,
        //   MaterialPageRoute(builder: (context) => QuanLySP())
        //   );
      }, icon: const Icon(Icons.arrow_back,color: Colors.white)),
    ),
         body:
       SingleChildScrollView(
            child:Column(
              mainAxisAlignment:MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/60),
        Container(
            height: MediaQuery.of(context).size.width/2.5,
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
                      height: MediaQuery.of(context).size.width/3,
                      width: MediaQuery.of(context).size.width/3,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child:InkWell(
                        onTap: ()async{
                          _pickImage();
                          },
                        child: _selected!=""? Image.network(_selected!):const Center(
                          child: Text("Thêm ảnh",style:TextStyle(fontSize: 14)),/*TODO:*/
                        ),
                      ),
                    ),
                    if (_selected != "")
                      ...[
                        Positioned(
                          top: 0,
                          right: 0,
                          child: IconButton(
                            icon: Icon(Icons.close_rounded,color: MyColor.light_pink,),
                            onPressed: () {
                              setState(() {
                                _selected = "";
                              });
                            },
                          ),
                        ),
                      ],
                  ],
                )
              ],
            )
        )
          ,
        SizedBox(height: MediaQuery.of(context).size.height/60),
        Container(
          height: MediaQuery.of(context).size.width/3,
          padding:const EdgeInsets.all(10),
          constraints:const BoxConstraints(maxHeight: 200.0),
          decoration:  BoxDecoration(
            color:  MyColor.light_grey
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
                      style: DefaultTextStyle.of(context).style,
                      children: const <TextSpan>[
                        TextSpan(text: 'Tên sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13,color: Colors.black,decoration: TextDecoration.none,)),
                        TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.red,decoration: TextDecoration.none,)),
                      ],
                    ),
                  ),
                  Text("${Them.char_ten.toString()}/120")
                ],
              ),
              TextField(
                controller: _tensp/*Todo:*/,
                maxLines:2,
                inputFormatters: [LengthLimitingTextInputFormatter(120)],
                onChanged: (text) {
                  setState(() {
                    Them.ten_sp=_tensp.text;
                    Them.char_ten = text.length;
                  });
                },
                decoration: const InputDecoration(
                  hintText: 'Nhập tên sản phẩm',
                  border: InputBorder.none // Loại bỏ đường gạch chân khi không có focus
                ),
              )
            ],

          ),
        ),
          SizedBox(height: MediaQuery.of(context).size.height/60),
          Container(
            height:MediaQuery.of(context).size.width/3,
            padding:const EdgeInsets.all(10),
            constraints:const BoxConstraints(maxHeight: 200.0),
            decoration:  BoxDecoration(
              color:  MyColor.light_grey
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
                        style: DefaultTextStyle.of(context).style,
                        children: const <TextSpan>[
                          TextSpan(text: 'Mô tả sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13,color: Colors.black,decoration: TextDecoration.none,)),
                          TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.red,decoration: TextDecoration.none,)),
                        ],
                      ),
                    ),
                    Text("${Them.char_mota.toString()}/3000")/*Todo:0/3000*/
                  ],
                ),
                TextField(
                  controller: _mota/*Todo:*/,
                  maxLines:2,
                  inputFormatters: [LengthLimitingTextInputFormatter(120)],
                  onChanged: (text) {
                    setState(() {
                      Them.mota_sp=_mota.text;
                      Them.char_mota = text.length;
                    });
                  },
                  decoration: const InputDecoration(
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
            height: MediaQuery.of(context).size.width/1.6,
            padding:const EdgeInsets.all(10),
            decoration:  BoxDecoration(
        color:  MyColor.light_grey
            ),
        child:Column(
          children: [
            ///Loáip
            Expanded(

                child: InkWell(onTap: (){
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const LoaiSP()),);
                },
                   child: Row(
              children: [
                const Expanded(child: Icon(Icons.category)), // Icon ở đầu
                Expanded(flex: 3,child: RichText(
                  text: TextSpan(
                    text: null,
                    style: DefaultTextStyle.of(context).style,
                    children:  const <TextSpan>[
                      TextSpan(text: 'Loại sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                      TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                    ],
                  ),
                ),),
                Expanded(child: Text(_loai_sp)),// Khoảng trắng giữa hai icon
                const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
              ],
            ),)),
            ///So luong
            Expanded(
                child: InkWell(onTap: (){
                  Them.kichco_sp="";
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => const SoLuongKho()),);
                },
                  child: Row(
                    children: [
                      const Expanded(child: Icon(Icons.warehouse)), // Icon ở đầu
                      Expanded(flex: 3,child: RichText(
                        text: TextSpan(
                          text: null,
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(text: 'Số lượng kho ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                            TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                          ],
                        ),
                      ),),
                      Expanded(child: Text(_soLuongKho.toString())),// Khoảng trắng giữa hai icon
                      const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                    ],
                  ),)),


            ///Gia
            Expanded(
                child: InkWell(
                  onTap: (){
                    Navigator.push( context,
                      MaterialPageRoute(builder: (context) => const GiaSP()),);
                  },
                  child: Row(
                    children: [
                      const Expanded(child: Icon(Icons.price_change)), // Icon ở đầu
                      Expanded(flex: 3,child:RichText(
                        text: TextSpan(
                          text: null,
                          style: DefaultTextStyle.of(context).style,
                          children: const <TextSpan>[
                            TextSpan(text: 'Giá bán ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: Colors.black,decoration: TextDecoration.none,)),
                            TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Colors.red,decoration: TextDecoration.none,)),
                          ],
                        ),
                      )
                        ,),
                      Expanded(child: Text(_giaBan.toStringAsFixed(3).toString(),maxLines: 1,)),// Khoảng trắng giữa hai icon
                      const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                    ],
                  ),)),
            ///Mua giam gia
            Expanded(

                child: InkWell(
                  onTap: (){
                    Navigator.push( context,
                      MaterialPageRoute(builder: (context) => const GiamGia()),);
                  },
                  child: Row(
                    children: [
                      const Expanded(child: Icon(Icons.percent)), // Icon ở đầu
                      const Expanded(flex: 3,child: Text("Giảm giá",style:TextStyle(fontSize: 14)),),
                      Expanded(child: Text(_giamGia.toString())),// Khoảng trắng giữa hai icon
                      const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                    ],
                  ),)),

            ///Kich Co
            Expanded(


                child: InkWell(
                  onTap: (){},
                  child: Row(
                    children:[
                      const Expanded(child: Icon(Icons.format_size)),
                      const Expanded(flex: 3,child: Text("Kích cỡ",style:TextStyle(fontSize: 14)),),
                      const Expanded(child: Text("")),
                      Expanded(child: Text(_kichco_sp)),
                    ],
                  ),)),
          ],
        ) ,
            ),
        ],

            ),
            )
    );
  }
  // Future _pickImage() async{
  //   final returnImage=await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(returnImage==null)return;
  //   Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
  //   UploadTask uploadTask = storageReference.putFile(File(returnImage.path));

  //   setState(() async {
  //     //_selected=File(returnImage!.path);
  //     uploadTask.whenComplete(() async {
  //       // Lấy URL của hình ảnh đã upload
  //       String imageUrl = await storageReference.getDownloadURL();

  //       // Cập nhật trạng thái và in ra console URL của hình ảnh
  //       setState(() {
  //         _selected = imageUrl;
  //         print("Image URL: $imageUrl");
  //         Them.linkImage = imageUrl;
  //       });
  //     });
  //   }
  //   );
  // }
  Future<void> _pickImage() async {
  final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (returnImage == null) return;

  Reference storageReference =
      FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
  UploadTask uploadTask = storageReference.putFile(File(returnImage.path));

  // Perform the asynchronous operation outside of setState
  try {
    await uploadTask.whenComplete(() async {
      // Lấy URL của hình ảnh đã upload
      String imageUrl = await storageReference.getDownloadURL();

      // Cập nhật trạng thái và in ra console URL của hình ảnh
      Them.linkImage = imageUrl;

      // Update the state inside a call to setState
      setState(() {
        _selected = imageUrl;
        print("Image URL: $imageUrl");
      });
    });
  } catch (error) {
    print("Error uploading image: $error");
  }
}


}