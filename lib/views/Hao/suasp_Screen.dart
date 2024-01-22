import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sales_application/model/suasp.dart';
import 'package:sales_application/model/color.dart';
import 'package:sales_application/views/Hao/qlsp_Screen.dart';
import 'package:sales_application/views/Hao/slkho_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import'package:firebase_storage/firebase_storage.dart';
import 'giamgia_Screen.dart';
import 'giasp_Screen.dart';
import 'loaisp_Screen.dart';
class SuaSP extends StatefulWidget {
  final Map<dynamic, dynamic> sp;

  const SuaSP(this.sp, {Key? key}) : super(key: key);

  @override
  _SuaSPState createState() => _SuaSPState();
}
class _SuaSPState extends State<SuaSP> {
  late DocumentReference _reference;
  final GlobalKey<FormState> _key = GlobalKey();
  String _selected="";
  late TextEditingController _tensp ;
  late TextEditingController _mota ;
  String _kichco_sp="";
  int _charCount1 = 0;
  int _charCount = 0;
  @override
  void initState() {
    super.initState();
    SuaMap.myMap=widget.sp;
    _tensp = TextEditingController(text: SuaMap.myMap['name']);
    _mota= TextEditingController(text: SuaMap.myMap['descriptions']);
    _charCount1 =_mota.text.length ;
    _charCount = _tensp.text.length;
    _selected=SuaMap.myMap['image'];
    _reference = FirebaseFirestore.instance.collection('products').doc(SuaMap.myMap['id']);
    if(int.parse(SuaMap.myMap['sizeS'])>0) {
      _kichco_sp+="S ";
    }
    if(int.parse(SuaMap.myMap['sizeM'])>0) {
      _kichco_sp+="M ";
    }
    if(int.parse(SuaMap.myMap['sizeL'])>0) {
      _kichco_sp+="L ";
    }
    if(int.parse(SuaMap.myMap['sizeXL'])>0) {
      _kichco_sp+="XL ";
    }
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
        appBar: AppBar(
          title: const Text("Sửa sản phẩm",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: MyColor.light_pink,
          actions: [
            TextButton(onPressed: () async {
              SuaMap.myMap['name']=_tensp.text;
              SuaMap.myMap['image']=_selected;
              SuaMap.myMap['descriptions']=_mota.text;
              if(SuaMap.myMap['name']==""||SuaMap.myMap['image']==""||
                  SuaMap.myMap['descriptions']==""||SuaMap.myMap['category']==""||
                  SuaMap.myMap['price']==""||int.parse(SuaMap.myMap['sizeS'])+int.parse(SuaMap.myMap['sizeM'])+int.parse(SuaMap.myMap['sizeL'])+int.parse(SuaMap.myMap['sizeXL'])==0||SuaMap.myMap['discount']==""){
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Bạn chưa nhập đầy đủ thông tin'),
                  ),
                );
              }
              else{
                try {
                  await _reference.update(Map<String,dynamic>.from(SuaMap.myMap));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Sửa thông tin thành công '),
                    ),
                  );
                } catch (e) {
                  print('Lỗi khi cập nhật tài liệu: $e');
                }
                SuaMap.myMap= {
                  'image':"" ,
                  'name':"",
                  'descriptions':"",
                  'category':"",
                  'price':"0",
                  'sizeS':"0",
                  'sizeM':"0",
                  'sizeL':"0",
                  'sizeXL':"0",
                  'discount':"0"
                };
                Navigator.pop( context,
                  MaterialPageRoute(builder: (context) => QuanLySP()),);

              }

            }, child: const Text("Lưu",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 17)))
          ],
          leading: IconButton(onPressed: ()async{
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => QuanLySP()),);
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
                              onTap: (){_pickImage();},
                              child: _selected!=""? Image.network(_selected):const Center(
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
                                  icon: Icon(Icons.close_rounded,color: MyColor.light_pink),
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
               // height: MediaQuery.of(context).size.width/3.5,
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
                        Text("${_charCount.toString()}/120")
                      ],
                    ),
                    TextField(
                      controller: _tensp/*Todo:*/,
                      maxLines:2,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(120)
                      ],
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
           //     height: MediaQuery.of(context).size.width/3.5,
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
                            text: null,
                            style: DefaultTextStyle.of(context).style,
                            children: const <TextSpan>[
                              TextSpan(text: 'Mô tả sản phẩm ', style: TextStyle(fontWeight: FontWeight.normal,fontSize: 13,color: Colors.black,decoration: TextDecoration.none,)),
                              TextSpan(text: '*', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color: Colors.red,decoration: TextDecoration.none,)),
                            ],
                          ),
                        ),
                        Text("${_charCount1.toString()}/3000")/*Todo:0/3000*/
                      ],
                    ),
                    TextField(
                      controller: _mota/*Todo:*/,
                      inputFormatters: [
                      LengthLimitingTextInputFormatter(3000)
                      ],
                      maxLines:2,
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
                            MaterialPageRoute(builder: (context) => SuaLoaiSP(SuaMap.myMap['id'])),);
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
                              Expanded(child: Text(SuaMap.myMap['category'])),// Khoảng trắng giữa hai icon
                              const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                            ],
                          ),)),
                    ///So luong
                    Expanded(
                        child: InkWell(onTap: (){
                          Navigator.push( context,
                            MaterialPageRoute(builder: (context) => SSoLuongKho(SuaMap.myMap['id'])),);
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
                              Expanded(child: Text("${int.parse(SuaMap.myMap['sizeS'])+int.parse(SuaMap.myMap['sizeM'])+int.parse(SuaMap.myMap['sizeL'])+int.parse(SuaMap.myMap['sizeXL'])}")),// Khoảng trắng giữa hai icon
                              const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                            ],
                          ),)),


                    ///Gia
                    Expanded(
                        child: InkWell(
                          onTap: (){
                            Navigator.push( context,
                              MaterialPageRoute(builder: (context) => SGiaSP(SuaMap.myMap['id'])),);
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
                              Expanded(child: Text("${SuaMap.myMap['price']}",maxLines: 1,)),// Khoảng trắng giữa hai icon
                              const Expanded(child: Icon(Icons.arrow_forward_ios)),  // Icon ở cuối
                            ],
                          ),)),
                    ///Mua giam gia
                    Expanded(

                        child: InkWell(
                          onTap: (){
                            Navigator.push( context,
                              MaterialPageRoute(builder: (context) => SGiamGia(SuaMap.myMap['id'])),);
                          },
                          child: Row(
                            children: [
                              const Expanded(child: Icon(Icons.percent)), // Icon ở đầu
                              const Expanded(flex: 3,child: Text("Giảm giá",style:TextStyle(fontSize: 14)),),
                              Expanded(child: Text("${SuaMap.myMap['discount']}")),// Khoảng trắng giữa hai icon
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
  Future _pickImage() async{
    final returnImage=await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage==null)return;
    Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now().millisecondsSinceEpoch}');
    UploadTask uploadTask = storageReference.putFile(File(returnImage.path));

    setState(() async {
      //_selected=File(returnImage!.path);
      uploadTask.whenComplete(() async {
        // Lấy URL của hình ảnh đã upload
        String imageUrl = await storageReference.getDownloadURL();

        // Cập nhật trạng thái và in ra console URL của hình ảnh
        setState(() {
          _selected = imageUrl;
          print("Image URL: $imageUrl");
          SuaMap.myMap['image'] = imageUrl;
        });
      });
    }
    );
  }
}