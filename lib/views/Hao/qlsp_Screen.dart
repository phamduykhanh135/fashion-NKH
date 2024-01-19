import 'package:flutter/material.dart';
import 'package:sales_application/model/color.dart';
import 'package:sales_application/presenters/item_qlsp.dart';
import 'package:sales_application/views/Hao/themsp_Screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class QuanLySP extends StatefulWidget {
  QuanLySP({Key? key}) : super(key: key);

  State<QuanLySP> createState() => _QuanLySPState();
}

class _QuanLySPState extends State<QuanLySP> {
//Firebase
  late Stream<QuerySnapshot> _stream;
  List<Map<String, dynamic>> searchResults = [];
  CollectionReference _reference=FirebaseFirestore.instance.collection('products');
  bool _isSearching = false;
  late List<Map<String,dynamic>> items;
  TextEditingController search=TextEditingController();
  void initializeString() {
    _stream = _reference.snapshots();
  }
  @override
  void initState() {
    super.initState();
    _stream = _reference.snapshots();
  }
  @override
  Widget _buildSeach(){
    return Container(
      width: double.infinity,
      height: 40,
      decoration: BoxDecoration(
          color:Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: TextField(
          controller: search,
          onChanged: (value) {
            updateSearchResults(removeDiacritics(value));
          },
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Icons.search,
            ),
            hintText: 'Search...',
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
  String removeDiacritics(String input) {
    return input.replaceAll(RegExp(r'[^\x00-\x7F]+'), ''); // Loại bỏ tất cả các ký tự không thuộc bảng ASCII
  }
  void updateSearchResults(String query) {
    setState(() {
      searchResults = items
          .where((product) =>
          removeDiacritics(product['name']) .toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching ?_buildSeach():Text("Quản lý sản phẩm", style: TextStyle(
            color: MyColor.dark_pink, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              _isSearching = !_isSearching;
            });
          }, icon: Icon(Icons.search, color: MyColor.dark_pink,)),
          IconButton(onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ThemSP()),);
          }, icon: Icon(Icons.add, color: MyColor.dark_pink)),
        ],
        leading:IconButton(onPressed: (){
          // Navigator.pop( context,
          //   MaterialPageRoute(builder: (context) => ThemSP()),);
        }, icon:Icon(Icons.arrow_back,color: MyColor.dark_pink)),)
      ,body: StreamBuilder<QuerySnapshot>(
      stream:_stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //Check error
        if (snapshot.hasError) {
          return Center(child: Text('Some error occurred ${snapshot.error}'));
        }
        if (snapshot.hasData) {
          QuerySnapshot querySnapshot = snapshot.data;
          List<QueryDocumentSnapshot> documents = querySnapshot.docs;
          items = documents.map((e) =>
          {
            'id': e.id,
            'image': e.get('image'),
            'name': e['name'],
            'descriptions':e['descriptions'],
            'category':e['category'],
            'price':e['price'],
            'sizeS':e['sizeS'],
            'sizeM':e['sizeM'],
            'sizeL':e['sizeL'],
            'sizeXL':e['sizeXL'],
            'discount':e['discount']
          }).toList();
          if (searchResults.isEmpty) {
            searchResults = items;
          }

          return ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                Map thisItem =searchResults[index];
                return ItemSP(thisItem['id']);

              }) ;
        }
        return Center(child: CircularProgressIndicator());
      },
    ),
    );
  }
}