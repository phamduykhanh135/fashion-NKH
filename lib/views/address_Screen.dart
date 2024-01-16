import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../data/address_Reader.dart';

class address_Screen extends StatefulWidget {
  const address_Screen({Key? key}) : super(key: key);

  @override
  State<address_Screen> createState() => _address_ScreenState();
}

class _address_ScreenState extends State<address_Screen> {
  List<Address> addr = [];
  int selectedAddressIndex = -1;

  void _loadData() async {
    await Address.loadData_address();
    setState(() {
      addr = Address.address;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Chọn địa chỉ nhận hàng")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('address').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print('Lỗi: ${snapshot.error}');
            return Text('Lỗi: ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasData && snapshot.data != null) {
            addr = snapshot.data!.docs
                .map((doc) => Address.fromJson(doc.data() as Map<String, dynamic>))
                .toList();
          }

          return Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: ListView(
              children: [
                Text("Chọn"),
                ListView.builder(
                  padding: EdgeInsets.only(left: 20),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: addr.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildAddressItem(index);
                  },
                ),
                const Divider(color: Colors.grey, thickness: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(onPressed: (){

                      }, icon: Icon(Icons.add), label: Text('Thêm địa chỉ mới'))
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildAddressItem(int index) {
    return ListTile(
      title: Row(
        children: [
          Radio(
            value: index,
            groupValue: selectedAddressIndex,
            onChanged: (value) {
              setState(() {
                selectedAddressIndex = value as int;
              });
            },
          ),
          Container(
            // Display your data from Firebase here
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(addr[index].fullname),
                Text(addr[index].addressText),
                Text(addr[index].phone),
                // Add more data as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}