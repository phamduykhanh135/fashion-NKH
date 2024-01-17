import 'package:flutter/material.dart';
import 'package:sales_application/model/searchsp.dart';
import 'package:sales_application/model/themsp.dart';
import 'package:sales_application/views/color.dart';
import 'package:sales_application/views/item_qlsp.dart';
import 'package:sales_application/views/search_qlsp.dart';
import 'package:sales_application/views/themsanpham.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class QuanLySP extends StatelessWidget {
  QuanLySP({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }
//Firebase
CollectionReference _reference=FirebaseFirestore.instance.collection('products');
  late Stream<QuerySnapshot> _stream;
  late List<Map<String,dynamic>> items;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quản lý sản phẩm", style: TextStyle(
            color: MyColor.dark_pink, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: MyColor.light_pink,
        actions: [
          IconButton(onPressed: () {
            Navigator.push( context,
              MaterialPageRoute(builder: (context) => SearchPage()),);
          }, icon: Icon(Icons.search, color: MyColor.dark_pink,)),
          IconButton(onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => ThemSP()),);
          }, icon: Icon(Icons.add, color: MyColor.dark_pink)),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          //Check error
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          //Check if data arrived
          if (snapshot.hasData) {
            //get the data
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;

            //Convert the documents to Maps
            items = documents.map((e) =>
            {

              'id': e.id,
              'image': e.get('image'),
              'name': e['name'],
              'descriptions':e['Descriptions'],
              'category':e['category'],
              'price':e['price'],
              'sizeS':e['sizeS'],
              'sizeM':e['sizeM'],
              'sizeL':e['sizeL'],
              'sizeXL':e['sizeXL'],
              'discount':e['discount']
            }).toList();
            Them.id_sp=items.length;
            //Display the list
            return ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  //Get the item at this index
                  Map thisItem = items[index];
                  //REturn the widget for the list items
                  return ItemSP(thisItem['id']);

                }) ;
          }

          //Show loader
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

}
